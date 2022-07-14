const express = require('express');
const router = express.Router();
const {User, validateUserRegister, validateUserLogging} = require('../models/user_model');
const _ = require('lodash');
const config = require('config');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const authorize = require('../middleware/authorization');

router.get('/', async(req, res)=>{
    const users = await User.find().select('-password -__v -id');
    res.send(users);
});

router.post('/signup', async (req, res)=>{
    const {error} = validateUserRegister(req.body);
    if (error) return res.status(400).send(error.details[0].message);

    let user = await User.findOne({email: req.body.email});
    if (user) {
        var message = {
            message: "User already registered."
        }
        return res.status(400).send(message);
    };

    user = new User(_.pick(req.body, ['name', 'email', 'password']));
    user.isAdmin = false;

    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(user.password, salt);
    user = await user.save();

    const result = {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'isAdmin': user.isAdmin,
        'token': user.generateAuthToken()
    }

    res.send(result);
});

router.post('/login', async (req, res)=>{
    const {error} = validateUserLogging(req.body);
    if (error) return res.status(400).send(error.details[0].message);

    let user = await User.findOne({email: req.body.email});
    console.log(user);
    if (!user){
        var message = {
            message: "Invalid email or password"
        }
        return res.status(400).send(message);
    } 

    const validPassword = await bcrypt.compare(req.body.password, user.password);
    if (!validPassword) {
        var message = {
            message: "Invalid email or password"
        }
        return res.status(400).send(message);
    } 
    const result = {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'isAdmin': user.isAdmin,
        'token': user.generateAuthToken()
    }

    res.send(result);

});

router.get('/profile', authorize, async(req, res)=>{
    const user = await User.findById(req.user._id).select('-__v -_id');
    if (!user) return res.status(404).send("The user does not exist");
    res.send(user);
});

router.put('/editProfile',authorize, async(req, res)=>{

    const {error} = validateUserRegister(req.body);
    if (error) return res.status(400).send(error.details[0].message);

    let user = await User.findOne({email: req.body.email});
    
    if (user && user._id != req.user._id){
        var message = {
            message: "Another user already registered with the given email"
        }
        return res.status(400).send(message);
    } 

    user = await User.findByIdAndUpdate(req.user._id,
        {
            name: req.body.name,
            email: req.body.email,
            password: req.body.password
        }
        , { new: true }
    );

    if (!user) return res.status(404).send('The user with the given ID was not found.');

    const result = {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'isAdmin': user.isAdmin,
        'token': user.generateAuthToken()
    }
    res.send(result);

});

module.exports = router;

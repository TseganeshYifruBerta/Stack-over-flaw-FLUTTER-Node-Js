const express = require('express');
const router = express.Router();
const {Question, validateQuestion} = require('../models/question_model');
const {User} = require('../models/user_model');
const authenticate = require('../middleware/authorization');
const ObjectId = require('mongoose').Types.ObjectId;
const validateObjectId =  require('../middleware/validateObjectId');

const _ = require('lodash');
const { header } = require('express/lib/request');

router.get('/', async(req, res) =>{
    const questions = await Question.find().select('-password');

    res.send(questions.reverse());
}); 

router.get('/:id', validateObjectId, async(req, res) =>{

    let question = await Question.findById(req.params.id);
    if (!question) return res.status(404).send('Invalid Id');
    question.answer
    res.send(question);

});

router.post('/add',authenticate, async (req, res)=>{
    const {error} = validateQuestion(req.body);

    if (error){
        var message = {
            message:  `${error.details[0].message}`
        }
        return res.status(400).send(message);
    }
    let user = await User.findById(req.user._id);

    const question = new Question({
        authorName: user.name,
        userId: user.id,
        title: req.body.title,
        description: req.body.description,
    });

    const result = await question.save();
        
    res.send(result);
        
});

router.put('/edit/:id',validateObjectId, authenticate, async (req, res)=>{
   
    const {error} = validateQuestion(req.body);
    if (error){
        var message ={
            message:  `${error.details[0].message}`
        }
        return res.status(400).send(message);
    }

    let question = await Question.findById(req.params.id);
    if (!question){
        var message ={
            message: 'The question with the given ID was not found.'
        }
        return res.status(404).send(message);
    } 
    if(req.user._id == question.userId){
       await Question.findByIdAndUpdate(req.params.id, {$set:{
            title: req.body.title,
            description: req.body.description,
            
        }});
    
    question = await Question.findById(req.params.id);
    return res.send(question);

    }
    
    
    else{
        var message ={
            message:  'A user can not update this question'
        }
        return res.status(401).send(message);
    } 

});

router.delete('/delete/:id',validateObjectId, authenticate, async (req, res)=>{

    const question = await Question.findById(req.params.id);

    if (!question){
        var message ={
            message: "The question with the given id is does not exist"
        }
        return res.status(404).send(message);
    }

    if(req.user._id == question.userId || req.user.isAdmin){
        await Question.deleteOne(question);
        return res.send(question);
    }
    else{
        var message ={
            message: 'A user can not delete this question'
        }
        return res.status(403).send(message);
    } 
});


module.exports = router;

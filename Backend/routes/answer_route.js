const express = require('express');
const router = express.Router();

const {Question} = require('../models/question_model');
const {User} = require('../models/user_model');
const {Answer, validateAnswer} = require('../models/answer_model');

const authenticate = require('../middleware/authorization');
const ObjectId = require('mongoose').Types.ObjectId;
const _ = require('lodash');

const { header } = require('express/lib/request');

router.get('/:id', async(req, res) =>{
    if(!isValidObjectId(req.params.id)) return res.status(404).send("The given id is not valid");
    
    const question = await Question.findById(req.params.id);
    if (!question) return res.status(404).send('The question with the given ID was not found.');

    let answers = [];
    for(let i=0; i < question.answers.length; i++){
        const answerId = question.answers[i];
        const answer = await Answer.findById(answerId).select('user questionId description dateOfAnswer -_id');
        answers.push(answer);
    }
    res.send(answers);
});


router.post('/add/:id',authenticate, async (req, res)=>{

    let isValid = isValidObjectId(req.params.id);
    if(!isValid){
        var message = { message: "The given id is not valid"}
        return res.status(404).send(message);
    } 

    let question = await Question.findById(req.params.id);
    if (!question){
        if(!isValid){
            var message = { message: 'The question with the given ID was not found.'}
            return res.status(404).send(message);
        } 
    } 

    let user = await User.findById(req.user._id);


    const {error} = validateAnswer(req.body);

    if (error){
        var message = {
            message:  `${error.details[0].message}`
        }
        return res.status(400).send(message);
    }
    
    const answer = new Answer({
        questionId: req.params.id,
        authorName: user.name,
        description: req.body.description,
        userId: req.user._id,
    });

    const result = await answer.save();

    await question.answers.unshift(result);
    await Question.findByIdAndUpdate(question.id, question);
    const r = await Question.findById(question.id);
    return res.send(r);
});



router.put('/edit/:id',authenticate, async (req, res)=> {

    if(!isValidObjectId(req.params.id)){
        var message = {
            message:  "The given id is not valid"
        }
        return res.status(404).send(message);
    } 
   
    const {error} = validateAnswer(req.body);
    if (error){
        var message ={
            message:  `${error.details[0].message}`
        }
        return res.status(400).send(message);
    }

    let answer = await Answer.findById(req.params.id);
    if (!answer){
        var message = {
            message: 'The answer with the given ID was not found.'
        }
        return res.status(404).send(message);
    } 

    
    let question = await Question.findById(answer.questionId);

    if(req.user._id == answer.userId){
        const result = await Answer.findByIdAndUpdate(req.params.id, {$set:{
            description: req.body.description,    
        }});
        const ans = await Answer.findById(result.id);
        
        for(let i=0; i < question.answers.length; i++){
            if (question.answers[i]._id == ans.id){
                question.answers[i] = ans;
                break;
            }
        }

        await Question.findByIdAndUpdate(question.id, question);

        const r = await Question.findById(question.id);
        return res.send(r);
    }

    else{
        var message = {
            message: 'A user can not update this question'
        }
        return res.status(400).send(message);
    } 
            
});

router.delete('/delete/:questionId/:answerId',authenticate, async (req, res)=>{
    if(!isValidObjectId(req.params.questionId)){
        var message = {
            message: "The given question id is not valid"
        }
        return res.status(404).send(message);
    } 

    if(!isValidObjectId(req.params.answerId)){
        var message = {
            message: "The given answer id is not valid"
        }
        return res.status(404).send(message);
    } 

    let question = await Question.findById(req.params.questionId);
    if (!question){
        var message = {
            message: 'The question with the given ID was not found.'
        }
        return res.status(404).send(message);
    } 

    let answer = await Answer.findById(req.params.answerId);
    if (!answer){
        var message = {
            message: 'The answer with the given ID was not found.'
        }
        return res.status(404).send(message);
    } 

    if(req.user._id == answer.userId){

        for(let i=0; i < question.answers.length; i++){
            if (question.answers[i]._id == answer.id){
                delete question.answers[i];
                break;
            }
        }
        const index = question.answers.indexOf(answer.id);
        if (index > -1) {
            question.answers.splice(index, 1);
        }
        await Question.findByIdAndUpdate(question.id, question);

        await Answer.findByIdAndDelete(answer.id);

        const r = await Question.findById(question.id);

        return res.send(r);
    }
    else{
        return res.status(400).send('A user can not delete this answer');
    } 
});

function isValidObjectId(id){
    if(ObjectId.isValid(id)){
        if((String)(new ObjectId(id)) === id)
            return true;       
        return false;
    }
    return false;
}
 

module.exports = router;

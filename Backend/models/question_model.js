const mongoose = require('mongoose');
const Joi = require('joi');


const questionSchema = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },
    authorName: {
      type: String,
      required: true,
  },
    title: {
      type: String,
      required: true,
      minlength: 5,
      maxLength: 255
    },
    description: {
      type: String,
      required: true,
      minlength: 5,
      maxlength: 1024,
    },
    dateOfQuestion: { 
        type: Date, 
        required: true,
        default: Date.now
      },
    answers: {
        type: Array,
        ref: 'Answer',
    },
  

  });

const Question = mongoose.model('Question', questionSchema);

function validateQuestion(question){
    const schema  = Joi.object({
        title: Joi.string().min(5).max(255).required(),
        description: Joi.string().min(5).max(2048).required(),
       
    });
    return schema.validate(question);
}

exports.Question = Question;
exports.validateQuestion = validateQuestion;



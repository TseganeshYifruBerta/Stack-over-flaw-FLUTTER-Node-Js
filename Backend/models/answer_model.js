const mongoose = require('mongoose');
const Joi = require('joi');


const answerSchema = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },
    authorName: {
        type: String,
        required: true,
    },
    questionId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Question',
        required: true,
    },
    description: {
      type: String,
      required: true,
      minlength: 5,
      maxlength: 2048,
    },
    dateOfAnswer: { 
        type: Date, 
        required: true,
        default: Date.now
      },

  });

const Answer = mongoose.model('Answer', answerSchema);

function validateAnswer(answer){
    const schema  = Joi.object({
        description: Joi.string().min(5).max(2048).required()
    });
    return schema.validate(answer);
}

exports.Answer = Answer;
exports.validateAnswer = validateAnswer;



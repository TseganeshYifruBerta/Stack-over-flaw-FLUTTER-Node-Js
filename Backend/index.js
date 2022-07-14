const mongoose = require('mongoose');
const express = require('express');
const app = express();
const users = require('./routes/user_route');
const questions = require('./routes/question_route');
const answers = require('./routes/answer_route');

const cors = require('cors');
const bodyParser = require('body-parser');
const config = require('config');
const {User, validateUserRegister} = require('./models/user_model');
const bcrypt = require('bcrypt');




if (!config.get('jwtPrivateKey')) {
    throw new Error('FATAL ERROR: jwtPrivateKey is not defined.');
  }


mongoose.connect('mongodb://localhost/aait_stack_overflow_dbs')
    .then(()=> console.log('Database Connected'),
      initial()
    )
    .catch(err => console.log(err));

async function initial(){
  var user = new User(
    {
      name: "birehan",
      email: "birehananteneh4@gmail.com",
      password: "birehan",
      isAdmin: true
    }
  );

  const salt = await bcrypt.genSalt(10);
  user.password = await bcrypt.hash(user.password, salt);
  
  let result = await User.findOne({email: user.email});
  if(result== null){
    await user.save();
  }

};

app.use(cors());
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use('/api/users', users);
app.use('/api/questions', questions);
app.use('/api/answers', answers);



const port = process.env.PORT || 8080;

app.listen(port, ()=> console.log(`Listening to port: ${port}`));

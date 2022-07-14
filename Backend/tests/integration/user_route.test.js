const request = require('supertest');
const {User, validateUserRegister, validateUserLogging} = require('../../models/user_model');
let server;
const bcrypt = require('bcrypt');
const mongoose = require('mongoose');

describe('/api/users',()=>{
    beforeEach(() =>{ server = require('../../index'); })
    afterEach(async() => { server.close();
    await User.remove({})
    })

    describe('GET /', ()=>{
        it('should return all the users', async()=>{
            await User.collection.insertMany([
                {name: 'name1', email: 'name1@gmail.com', password: 'name1'},
                {name: 'name2', email: 'name2@gmail.com', password: 'name2'},
            ]);
            const res = await request(server).get('/api/users');
            expect(res.status).toBe(200);
            expect(res.body.length).toBe(2);
            expect(res.body.some(g => g.name === 'name1')).toBeTruthy();
            expect(res.body.some(g => g.name === 'name2')).toBeTruthy();

        });
    });
    
    describe('POST /register', ()=>{
        let name, email, password;

        const exec = async ()=>{
            return await request(server)
            .post('/api/users/register')
            .send({name, email, password});
        }
      
        beforeEach(async() => {
            name = 'birehan';
            email = 'birehan@gmail.com',
            password = '12345';
        })

        it('should return 200 if user register successfully.', async()=>{
            const res = await exec();
            const user = await User.find({name: 'birehan'});

            expect(user).not.toBeNull();
            expect(res.status).toBe(200);
        });

        it('should return the user if it is valid', async()=>{           
            const res = await exec();
            expect(res.body).toHaveProperty('name', 'birehan');
            expect(res.body).toHaveProperty('email', 'birehan@gmail.com');
        });

        it('should return 400 if the name is invalid', async()=>{ 
            name = '1';          
            const res = await exec();
            expect(res.status).toBe(400);
        });
        it('should return 400 if the email is invalid', async()=>{ 
            email = '1';          
            const res = await exec();
            expect(res.status).toBe(400);
        });
        it('should return 400 if the password is invalid', async()=>{ 
            password = '1';        
            const res = await exec();
            expect(res.status).toBe(400);
        });
        it('should return 400 if the email already exist.', async()=>{ 
            const user = new User({name:'bekele', email:'birehan@gmail.com', password:'12345'});
            await user.save();
            
            const res = await exec();
            expect(res.status).toBe(400);
        });
    });
    describe('POST /login', ()=>{
        let email, password, user;

        const exec = async ()=>{
            return await request(server)
            .post('/api/users/login')
            .send({email, password});
        }
      
        beforeEach(async() => {
            email = 'birehan@gmail.com',
            password = '12345';

            user = new User({name:'birehan', email:'birehan@gmail.com', password: '12345'});
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(user.password, salt);
            await user.save();

        })

        it('should return 200 if user login successfully.', async()=>{
            const res = await exec();
            expect(res).not.toBeNull();
            expect(res.status).toBe(200);
        });

        it('should return the token if it is valid', async()=>{           
            const res = await exec();
            expect(res.body.token).not.toBeNull();
        });

        it('should return 400 if the email is invalid', async()=>{ 
            email = '1';          
            const res = await exec();
            expect(res.status).toBe(400);
        });

        it('should return 400 if the password is invalid', async()=>{ 
            password = '1';        
            const res = await exec();
            expect(res.status).toBe(400);
        });

        it('should return 400 if the email does not exist', async()=>{ 
            email = 'bire@gmail.com';          
            const res = await exec();
            expect(res.status).toBe(400);
        });

        it('should return 400 if the password is incorrect', async()=>{ 
            password = '123456';        
            const res = await exec();
            expect(res.status).toBe(400);
        });
    });

    describe('GET /profile', ()=>{
        let token, user;

        const exec = async ()=>{
            return await request(server)
            .get('/api/users/profile')
            .set('x-auth-token', token)
            .send();
        }
      
        beforeEach(async() => {
            let input = {_id: mongoose.Types.ObjectId(), name:'birehan', email:'birehan@gmail.com', password:'12345', isAdmin:true};
            user = new User(input);
            await user.save();

            token = new User({_id:input._id, isAdmin:true}).generateAuthToken();

        })

        it('should return 200 if the authenticated', async()=>{
            const res = await exec();
            expect(res.status).toBe(200);
        });

        it('should return the user if it is valid', async()=>{
            const res = await exec();
            expect(res.body).toHaveProperty('name', 'birehan');            
        });

        it('should return 401 if no token provided', async()=>{
            token = '';
            const res = await exec();
            expect(res.status).toBe(401);
        });

        it('should return 400 if invalid token provided', async()=>{
            token = null;
            const res = await exec();
            expect(res.status).toBe(400);
        });

        it('should return 404 if the user does not exist', async()=>{
            token = new User({_id:mongoose.Types.ObjectId(), isAdmin:true}).generateAuthToken();
            const res = await exec();
            expect(res.status).toBe(404);
        });
    });

});
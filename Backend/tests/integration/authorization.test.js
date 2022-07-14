const request = require('supertest');
const {User} = require('../../models/user_model');
const {Question} = require('../../models/question_model');

let server;

describe('authorization middleware', ()=>{
   
    beforeEach(() =>{ server = require('../../index'); })
    afterEach(async() => { 
        await Question.remove();
        server.close();})
    let token;
    const exec = ()=>{
        return request(server)
        .post('/api/questions/add')
        .set('x-auth-token', token)
        .send({title: 'here is my title', description: 'here is my description', tags: ['tag1', 'tag2']});
    };

    beforeEach(()=>{
        token = new User().generateAuthToken();
    });

    it('should return 401 if no token is provided',async()=>{
        token = '';
        const res = await exec();
        expect(res.status).toBe(401);
    });

    it('should return 400 if token is invalid',async()=>{
        token = 'a';
        const res = await exec();
        expect(res.status).toBe(400);
    });


    it('should return 200 if token is valid',async()=>{
        const res = await exec();
        expect(res.status).toBe(200);
    });

});
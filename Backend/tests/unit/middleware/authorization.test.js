const {User} = require('../../../models/user_model');
const auth = require('../../../middleware/authorization');
const mongoose = require('mongoose');

describe('Authorization middleware', ()=>{
   it('should populate req.user with the payload of a valid JWT',()=>{
       const user = {_id: mongoose.Types.ObjectId().toHexString(),
                     isAdmin: true };
        const token = new User(user).generateAuthToken();
        const req = {
            header: jest.fn().mockReturnValue(token),
        };
        const res = {};
        const next= jest.fn();
        auth(req, res, next);
        expect(req.user).toBeDefined();
        expect(req.user).toMatchObject(user);
    
   });
});
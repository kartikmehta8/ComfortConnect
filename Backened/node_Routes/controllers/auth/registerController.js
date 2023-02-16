import Joi from 'joi';
import CustomErrorHandler from '../../services/CustomErrorHandler';
//import { RefreshToken, User } from '../../models';
import JwtService from '../../services/JwtService';
import bcrypt from 'bcrypt';
import { REFRESH_SECRET } from '../../config';

const registerController = {
    async register(req,res,next){
        //logic
        //checklist
        //validate the request
        //authorize the request
        //check if user is in database already
        //prepare model
        //store in database
        //generate jwt token
        //send response


        //Validation
        //console.log(req.body);
        const registerSchema = Joi.object({
           name: Joi.string().min(3).max(30).required(),
           email: Joi.string().email().required(),
           password: Joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')).required(),
           repeat_password : Joi.ref('password')
        });

        const {error} = registerSchema.validate(req.body);

        if(error){
          return next(error);  
        }
        //check if user is in the database already
        res.json({json: req.body});
        try{
          const exist = await User.exists({email: req.body.email});// return true or false
          if(exist){
              return next(CustomErrorHandler.alreadyExist('This email is alreay exist'));
          }
        }catch(err){
              return next(err);    
        }


        //Hash Password
        const hashPassword = await bcrypt.hash(req.body.password,10);

        // prepare the model
        const {name,username,email,password} = req.body;
        const user = new User({
            name,
            username,
            email,
            password: hashPassword
        })
        let access_token;
        let refresh_token;
        try{
            const result = await user.save();
            //const product
            //Token
            // console.log("ACEES UP");
            access_token = JwtService.sign({_id: result._id,role: result.role, });
            // console.log("ACEES Down");
            refresh_token = JwtService.sign({_id: result._id,role: result.role, },'1y',REFRESH_SECRET);
            // console.log(refresh_token);
 
            //database whitelist
            const refreshtoken = new RefreshToken({
                refresh_token
            })
            await refreshtoken.save();

        }catch(err){
            console.log("EERR KE ANDER");
            return next(err);
        }

        res.json({access_token, refresh_token});
    }
}

export default registerController;
import Joi from "joi";
import { REFRESH_SECRET } from "../../config";
import { RefreshToken, User } from "../../models";
import JwtService from "../../services/JwtService";

const refreshController = {
    async refresh(req,res,next){
       //Validate
      // console.log("initial");
       const refreshSchema = Joi.object({
        refresh_token : Joi.string().required()
    });
        //console.log("After Schema");
     const {error} = refreshSchema.validate(req.body);
     if(error){
         //console.log("ERROR");
        return next(error);
     }

     //database 
     let refreshtoken;
     try{
        
         //console.log(req.body.refresh_token);
         let {refresh_token} = req.body;
        let refreshtoken = await RefreshToken.findOne({refresh_token});
        console.log("refersh otlksjf");
        console.log(refreshtoken);
        if(!refreshtoken){
            console.log("ERROR TOKEN");
            return next(CustomErrorHandler.unauthorized('Invalid refresh token'));
        }
        let userId;
        try{
            console.log("try ke ander");
          const {_id} = JwtService.verify(refreshtoken.refresh_token,REFRESH_SECRET);
          console.log(_id);
          userId = _id;
         }catch(err){
            return next(CustomErrorHandler.unauthorized('Invalid refresh token'));
        }

        
        const user = User.findOne({_id: userId});
        if(!user){
            return next(CustomErrorHandler.unauthorized('No user found'));
        }
         // tokens
         const access_token = JwtService.sign({_id: user._id,role: user.role });
           refresh_token = JwtService.sign({_id: user._id,role: user.role, },'1y',REFRESH_SECRET);
            // console.log(refresh_token);
 
            //database whitelist
          refreshtoken = new RefreshToken({
                refresh_token
            })
            await refreshtoken.save();
           res.json({access_token, refresh_token});


     }catch(err){
         return next(new Error("Something went Wrong" + err.message));
     }
    }
}
export default refreshController;
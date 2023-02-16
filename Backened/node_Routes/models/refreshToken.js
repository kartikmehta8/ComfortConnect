import mongoose from "mongoose";
const Schema = mongoose.Schema;

const refreshTokenSchema = new Schema({
    refresh_token:{
        type: String,
        unique: [true,"UNIQUE"]
    },
},{timestamps : false});    

export default mongoose.model('RefreshToken',refreshTokenSchema,'refreshTokens');
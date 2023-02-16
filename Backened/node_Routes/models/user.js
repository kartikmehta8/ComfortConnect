import mongoose from "mongoose";
//console.log(mongoose);
const Schema = mongoose.Schema;

const userSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    username:{
        type: String,
        required: true,
        unique: true,
    },
    email:{
        type: String,
        unique: true,
    },
    phone_number:{
        type:  Number
    },
    gender :{
        type: string
    },
    password:{
        type: String,
        required: true
    }
},{timestamps : true});    

export default mongoose.model('User',userSchema,'users');
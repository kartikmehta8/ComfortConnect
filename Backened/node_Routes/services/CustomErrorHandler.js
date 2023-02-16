class CustomErrorHandler extends Error {
    
    constructor(status, message){
        super();
        this.status = status;
        this.message = message;
    }
    static alreadyExist(message){
        //for static method object will not be defined
        return new CustomErrorHandler(409,message);
    }
    static wrongCredentials(message = 'Username or Password is wrong'){
        //for static method object will not be defined
        return new CustomErrorHandler(401,message);
    }
    static unAuthorized(message = 'unAuthorized'){
        return new CustomErrorHandler(401,message);
    }
    static notFound(message = '404 User Not Found'){
        return new CustomErrorHandler(404,message);
    }
    static serverError(message = 'Internal Server Error'){
        return new CustomErrorHandler(502,message);
    }
}

export default CustomErrorHandler;
import express from "express";
import {registerController,fileController} from "../controllers";
import auth from "../middlewares/auth";
const router = express.Router();


router.post('/login',registerController.login);
router.post('/register',registerController.register);
router.post('/store',auth,fileController.store);

export default router;  
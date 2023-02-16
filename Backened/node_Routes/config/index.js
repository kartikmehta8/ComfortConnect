import dotenv from 'dotenv';
dotenv.config();
export const {
	APP_PORT,
	DEBUG_MODE,
	MONGO_URL,
	SECRET,
	REFRESH_SECRET,
} = process.env;

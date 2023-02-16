const multer = require('multer');
const fs = require('fs');
const AWS = require('aws-sdk');

import cloudinary from '../services/Cloudinary';
import path from 'path';
import CustomErrorHandler from '../services/CustomErrorHandler';
import { CloudFormation } from 'aws-sdk';
const s3 = new AWS.S3({
    accessKeyId: '',
    secretAccessKey: '',
    endpoint: 'https://s3.filebase.com',
    region: 'us-east-1',
    signatureVersion: 'v4',
});

const storage = multer.diskStorage({
	destination: (req, file, cb) => cb(null, 'uploads/'),
	filename: (req, file, cb) => {
		const uniqueName = `${Date.now()}-${Math.round(
			Math.random() * 1e9
		)}${path.extname(file.originalname)}`;
		cb(null, uniqueName);
	},
});

const handleMultipartData = multer({
	storage,
	limits: {
		fileSize: 1000000 * 50, //5mb
	},
}).array('file');

const productController = {
	async store(req, res, next) {
		//Multipart form data
		handleMultipartData(req, res, async (err) => {
			if (err) {
				return next(CustomErrorHandler.serverError('Only 4 photos required'));
			}

		    console.log(req.files[0].path)
			await fs.readFile(req.files[0].path, async (err, data) => {
				if (err) {
					console.error(err);
					return;
				}
				
				const params = {
					Bucket: 'narutovengersheavendemo',
					Key: 'demo',
					Body: data,
				};
				
				const request = s3.putObject(params);
				await request.on('httpHeaders', (statusCode, headers) => {
					try{

						console.log(`CID: ${headers['x-amz-meta-cid']}`);
						res.send({status: "true", CID: headers['x-amz-meta-cid']});
					}catch(e){
						res.send(err);
					}
				});
				request.send();
			});
			// res.send({status: "true"});

			
		});
	},
	};

export default fileController;

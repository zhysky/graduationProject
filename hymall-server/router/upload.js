import { Router } from 'express';
import uploadMiddleware from '../middleware/upload';

const upload = Router();

upload.post('/', uploadMiddleware.single('file'), (req, res) => {
	const file = req.file;
	file.url = `${process.env.UPLOAD_URL}/${file.filename}`;
	res.send(file);
});

export default upload;
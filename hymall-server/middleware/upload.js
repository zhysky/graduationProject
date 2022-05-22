import multer from 'multer';
import fs from 'fs';

// const storage = {
// 	destination(req, file, cb) {
// 		let dir = __dirname + '/../uploads';
// 		//判断目录是否存在，没有则创建
// 		if (!fs.existsSync(dir)) {
// 			fs.mkdirSync(dir, { recursive: true });
// 		}
// 		//dir就是上传文件存放的目录
// 		cb(null, dir);
// 	},
// 	filename (req, file, cb) {
// 		let filename = file.originalname.split('.');
// 		filename = filename.slice(0, filename.length - 1).join('-');
// 		const fileExt = file.mimetype.split('/').pop();
// 		cb(null, filename + '-' + Date.now() + '.' + fileExt);
// 	}
// } |> multer.diskStorage;
//
// const uploadMiddleware = multer({ storage: storage });


const uploadMiddleware = {
	'destination'(req, file, cb) {
		const dir = __dirname + '/../uploads';
		const { mkdirSync, existsSync } = fs;
		if (!existsSync(dir)) mkdirSync(dir, { recursive: true });
		cb(null, dir);
	},
	filename(req, file, cb) {
		let filename = file.originalname.split('.');
		filename = filename.slice(0, filename.length - 1).join('-');
		const fileExt = file.mimetype.split('/').pop();
		cb(null, filename + '-' + Date.now() + '.' + fileExt);
	}
}
	|> multer.diskStorage
	|> (_ => ({ storage: _ }))
	|> (_ => multer(_));

export default uploadMiddleware;
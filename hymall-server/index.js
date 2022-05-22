import './utils/loadEnv';
import './db';

import express from 'express';
import router from './router';

const { HOST, NODE_ENV, PORT } = process.env;

const app = express();

app.use(require('cors')());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(router);
app.use('/uploads', express.static(__dirname + '/uploads'));

app.use(function (err, req, res, next) {
	if (NODE_ENV==='development') console.log(err.stack);
	next();
});

const port = PORT || 3001;
const host = HOST || 'localhost';

app.listen(port, () => {
	console.log(`Server started on http://${host}:${port}`);
});

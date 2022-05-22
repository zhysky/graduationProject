import { createConnection } from 'typeorm';
import { init } from './init';

const { DB_DATABASE, DB_HOST, DB_USERNAME, DB_PORT, DB_PASSWORD } = process.env;
({
	type: 'mysql',
	host: DB_HOST,
	port: DB_PORT,
	username: DB_USERNAME,
	password: DB_PASSWORD,
	database: DB_DATABASE,
	entities: [__dirname + '/../entity/*.entity.js'],
	synchronize: true
} |> createConnection).then(async () => {
	console.log('数据库连接成功');
	await init();
}).catch(err => console.log('数据库连接失败', err));
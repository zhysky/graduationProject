import { Router } from 'express';
import { createToken, isValidToken } from '../../middleware/jwt';
import { addUser, findByName, findOne, getInfo, updateAddress, updateInfo, verifyPassword } from '../../service/user';

const user = Router();

user.use(isValidToken(['/login', '/register']));

user.post('/register', async (req, res) => {
	const { username, password } = req.body;
	const user = await findByName({ name: username });
	if (user.length) {
		res.send({
			code: 0,
			message: '用户已存在'
		});
	} else {
		const uu = await addUser({
			name: username,
			password
		});
		res.send({
			code: 1,
			uu,
			message: '注册成功'
		});
	}
});

user.post('/login', async (req, res) => {
	const { username = '', password = '' } = req.body;
	const user = await findOne(username);
	if (user && verifyPassword(password, user.password)) {
		const token = createToken({ name: user.name }, '30m');
		res.send({
			code: 1,
			username,
			token,
			message: '登录成功'
		});
	} else {
		res.status(401).send({
			code: 0,
			message: '用户名或密码不正确'
		});
	}
});

user.get('/info', async (req, res) => {
	const { user: name = '' } = req.query;
	const user = await getInfo(name);
	if (user) {
		res.send({
			code: 1,
			data: user,
		});
	} else {
		res.status(401).send({
			code: 0,
			message: '请先登录'
		});
	}
});

user.put('/info', async (req, res) => {
	const { user: name = '', userInfo = {} } = req.body;
	const user = await findOne(name);
	if (user) {
		await updateInfo(user, userInfo);
		res.send({
			code: 1,
			message: '更新成功'
		});
	} else {
		res.status(401).send({
			code: 0,
			message: '请先登录'
		});
	}
});

user.put('/address', async (req, res) => {
	const { user: name = '', address = [] } = req.body;
	const user = await findOne(name);
	if (user) {
		await updateAddress(user, address);
		res.send({
			code: 1,
			message: '更新成功'
		});
	} else {
		res.status(401).send({
			code: 0,
			message: '请先登录'
		});
	}
});

export default user;
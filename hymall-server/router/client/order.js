import { Router } from 'express';
import { isValidToken } from '../../middleware/jwt';
import { createOrder, getOrderByPage } from '../../service/order';

const order = Router();

order.use(isValidToken());

order.post('/create', async (req, res) => {
	await createOrder(req.body);
	res.send({
		code: 1,
		message: '支付成功'
	});
});

order.get('/list', async (req, res) => {
	const { user, skip = 0, take = 3 } = req.query;
	const data = await getOrderByPage(user, skip, take);
	res.send(data);
});

export default order;
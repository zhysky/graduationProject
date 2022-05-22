import { Router } from 'express';
import { isValidToken } from '../../middleware/jwt';
import { getAllOrderByPage } from '../../service/order';

const order = Router();

order.use(isValidToken());


order.get('/list', async (req, res) => {
	const { skip = 0, take = 3 } = req.query;
	const data = await getAllOrderByPage(skip, take);
	res.send(data);
});

export default order;
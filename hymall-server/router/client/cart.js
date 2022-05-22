import { Router } from 'express';
import { isValidToken } from '../../middleware/jwt';
import { cartDel, cartRemove, cartTo } from '../../service/cart';


const cart = Router();

cart.use(isValidToken());

cart.post('/add', async (req, res) => {
	const { user, cart } = req.body;
	const data = await cartTo(user, cart);
	res.send(data);
});

cart.post('/del', async (req, res) => {
	const { user } = req.body;
	const data = await cartDel(user);
	res.send(data);
});

cart.post('/remove', async (req, res) => {
	const { user, cart } = req.body;
	const data = await cartRemove(user, cart);
	res.send(data);
});



export default cart;
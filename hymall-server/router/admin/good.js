import { Router } from 'express';
import { addGood, delGood, getGood, getGoodByPage, updateGood } from '../../service/good';


const good = Router();

good.get('/page', async (req, res) => {
	const { skip = 0, take = 3 } = req.query;
	const data = await getGoodByPage(skip, take);
	res.send(data);
});

good.get('/one', async (req, res) => {
	const { id } = req.query;
	const data = await getGood(id);
	res.send(data);
});

good.post('/add', async (req, res) => {
	const { good, category } = req.body;
	const data = await addGood(good, category);
	res.send(data);
});

good.put('/update/:id', async (req, res) => {
	const { id } = req.params;
	const { good, category } = req.body;
	const data = await updateGood(id, good, category);

	res.send(data);
});

good.delete('/del/:id', async (req, res) => {
	const { id } = req.params;
	const data = await delGood(id);
	res.send(data);
});

export default good;
import { Router } from 'express';
import { getGood, getGoodByName, getGoodByPage, getGoodDetail, getNewGood, getRecommedGood, getSelectGood } from '../../service/good';


const good = Router();

// client
good.get('/new', async (req, res) => {
	const data = await getNewGood();
	res.send(data);
});

good.get('/recommed', async (req, res) => {
	const data = await getRecommedGood();
	res.send(data);
});

good.get('/select', async (req, res) => {
	const data = await getSelectGood();
	res.send(data);
});

good.get('/detail/:id', async (req, res) => {
	const { id } = req.params;
	const data = await getGoodDetail(id);
	res.send(data);
});

good.get('/search', async (req, res) => {
	const { goodName = '', skip = 0, take = 24, order = '' } = req.query;
	const data = await getGoodByName(goodName, skip, take, order);
	res.send(data);
});


// admin
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



export default good;
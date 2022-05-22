import { Router } from 'express';
import { getCategoryTreeAll, getGoodByCategory } from '../../service/category';

const category = Router();

category.get('/list', async (req, res) => {
	const data = await getCategoryTreeAll();
	res.send(data);
});

category.get('/good/:id', async (req, res) => {
	const { id } = req.params;
	const { skip = 0, take = 24, order = '' } = req.query;
	const data = await getGoodByCategory(id, skip, take, order );
	res.send(data);
});

export default category;
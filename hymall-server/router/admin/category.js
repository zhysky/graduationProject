import { Router } from 'express';
import { addCategory, delCategory, getCategoryTreeAll, getCategoryTreeByPage, getGoodByCategory } from '../../service/category';


const category = Router();

category.get('/list_tree', async (req, res) => {
	const data = await getCategoryTreeAll();
	res.send(data);
});

category.get('/good/:id', async (req, res) => {
	const { id } = req.params;
	const skip = null, take = null, order = null;
	const data = await getGoodByCategory(id, skip, take, order);
	res.send(data);
});

category.get('/page', async (req, res) => {
	const { skip = 0, take = 3 } = req.query;
	const data = await getCategoryTreeByPage(skip, take);
	res.send(data);
});

category.post('/add', async (req, res) => {
	const { parentCategory, newCategory } = req.body;
	const data = await addCategory(parentCategory, newCategory);
	res.send(data);
});

category.delete('/del/:id', async (req, res) => {
	const { id } = req.params;
	const data = await delCategory(id);
	res.send(data);
});

export default category;
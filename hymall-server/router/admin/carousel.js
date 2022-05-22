import { Router } from 'express';
import { getCarousels, addCarousel, delCarousel } from '../../service/carousel';

const carousel = Router();

carousel.get('/', async (req, res) => {
	const { skip = 0, take = 4 } = req.query;
	const carousels = await getCarousels(skip, take);
	res.send(carousels);
});

carousel.post('/', async (req, res) => {
	const data = await addCarousel(req.body);
	res.send(data);
});

carousel.delete('/:id', async (req, res) => {
	const { id } = req.params;
	const data = await delCarousel(id);
	res.send(data);
});

export default carousel;
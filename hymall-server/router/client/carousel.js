import { Router } from 'express';
import { getCarousels } from '../../service/carousel';

const carousel = Router();

carousel.get('/', async (req, res) => {
	const { skip = 0, take  } = req.query;
	const carousels = await getCarousels(skip, take);
	res.send(carousels);
});

export default carousel;
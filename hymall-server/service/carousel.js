import Carousel from '../entity/Carousel.entity';

export async function getCarousels(skip, take) {
	return await Carousel.findAndCount({
		select: ['id', 'src', 'good_id', 'good_name'],
		skip,
		take,
		cache: true
	});
}

export async function addCarousel(carousel) {
	await (carousel |> Carousel.create |> Carousel.save);
	return {
		code: 1,
		message: 'Carousel add successfully'
	};
}

export async function delCarousel(id) {
	await Carousel.delete(id);
	return {
		code: 1,
		message: 'Carousel remove successfully'
	};
}

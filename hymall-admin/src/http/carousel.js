import http from './http';

export async function getCarouselList(skip, take) {
	return http.get('/carousel', {
		params: {
			skip,
			take
		}
	});
}

export async function addCarousel(carouselForm) {
	return await http.post('/carousel', carouselForm);
}

export async function delCarousel(id) {
	return http.delete(`/carousel/${id}`);
}
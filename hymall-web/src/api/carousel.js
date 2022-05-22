import http from '../utils/http';

export async function getCarouselList() {
	return http.get('/carousel', {
		params: {
			skip: null,
			take: null
		}
	});
}

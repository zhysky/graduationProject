import store from '../store';
import http from '../utils/http';

export async function getCategory() {
	return await http.get('/category/list');
}

export async function getGoodByCategory(cate, skip, take) {
	return await http.get(`/category/good/${cate}`, {
		params: {
			skip,
			take,
			order: store.state.order
		}
	});
}
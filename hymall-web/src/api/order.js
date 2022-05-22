import store from '../store';
import http from '../utils/http';

export async function createOrder(order) {
	const user = store.state.user.name;
	return await http.post('/order/create', {
		user,
		...order
	});
}

export async function getOrder(skip, take) {
	const user = store.state.user.name;
	console.log(user);
	return await http.get('/order/list', {
		params: {
			user,
			skip,
			take
		}
	});
}
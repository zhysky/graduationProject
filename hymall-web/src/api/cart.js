import store from '../store';
import http from '../utils/http';

export async function cartTo(cart) {
	const user = store.state.user.name;
	http.post('/cart/add', {
		user,
		cart
	});
}

export async function cartDel() {
	const user = store.state.user.name;
	http.post('/cart/del', { user });
}

export async function cartRemove(cart) {
	const user = store.state.user.name;
	http.post('/cart/remove', {
		user,
		cart
	});
}
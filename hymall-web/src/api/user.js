import store from '../store';
import http from '../utils/http';

export async function register(user) {
	return await http.post('/user/register', user);
}

export async function login(user) {
	return await http.post('/user/login', user);
}

export async function getInfo() {
	const user = store.state.user.name;
	return await http.get('/user/info', {
		params: {
			user
		}
	});
}

export async function updateInfo(userInfo) {
	const user = store.state.user.name;
	return await http.put('/user/info', {
		user,
		userInfo
	});
}

export async function updateAddress(address) {
	const user = store.state.user.name;
	return await http.put('/user/address', {
		user,
		address
	});
}
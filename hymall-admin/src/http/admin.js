import http from './http';
export function getAdminList() {
	return http({
		url: '/admin/list'
	});
}

export async function login(data) {
	return http({
		method: 'post',
		url: '/login',
		data
	});
}
const token = 'token';
export function getToken() {
	return localStorage.getItem(token) || '';
}
export function setToken(val) {
	localStorage.setItem(token, val.toString());
}
export function delToken() {
	localStorage.removeItem(token);
}
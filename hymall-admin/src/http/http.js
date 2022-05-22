import axios from 'axios';
import Vue from 'vue';
import router from '../router';

export const baseURL = process.env.VUE_APP_API_URL || '/admin/api';

const http = axios.create({
	baseURL,
	timeout: 5000,
	timeoutErrorMessage: 'timeout'
});

http.interceptors.request.use(config => {
	config.headers.Authorization = 'Bearer ' + (localStorage.token || '');
	return config;
});

http.interceptors.response.use(res => {
	return res.data;
}, err => {
	if (err.response.data.message) {
		Vue.prototype.$message({
			type: 'error',
			message: err.response.data.message
		});
		if (err.response.status.toString().startsWith('40')) {
			router.push('/login');
		}
	}
	return Promise.reject(err);
});

export default http;
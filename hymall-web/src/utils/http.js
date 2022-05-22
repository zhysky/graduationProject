import axios from 'axios';
import router from '../router';
import { getToken } from './token';
import { Message } from 'element-ui';

const http = axios.create({
	baseURL: process.env.VUE_APP_API_URL || '/api'
});

http.interceptors.request.use(config => {
	config.headers.Authorization = 'Bearer ' + getToken();
	return config;
});

http.interceptors.response.use(res => {
	if (res.data.code === 0) {
		Message.error(res.data.message);
	}
	return res.data;
}, err => {
	if (err.response.status === 401) {
		if (err.response.data.code === 0) {
			Message.error(err.response.data.message);
		}
		router.push('/login').catch(err => {
			return err;
		});
		return err.response.data;
	}
	return Promise.reject(err);
});

export default http;
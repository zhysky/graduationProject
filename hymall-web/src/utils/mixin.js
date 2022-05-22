import Vue from 'vue';

Vue.config.productionTip = false;

Vue.mixin({
	computed: {
		uploadUrl() {
			return process.env.VUE_APP_UPLOAD_URL;
		}
	},
	methods: {
		getAuthHeader() {
			return {
				Authorization: `Bearer ${localStorage.token || ' '}`
			};
		}
	}
});
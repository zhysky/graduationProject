import Vue from 'vue';
import '@mdi/font/css/materialdesignicons.css';
import Vuetify from 'vuetify/lib';
// import 'vuetify/dist/vuetify.min.css';


Vue.use(Vuetify);

const vuetify = new Vuetify({
	theme: {
		themes: {
			light: {
				primary: '#03a9f4',
				secondary: '#2196f3',
				accent: '#4caf50',
				error: '#ff5722',
				warning: '#ffc107',
				info: '#607d8b',
				success: '#cddc39',
			},
			iconfont: 'mdi'
		},
	},
});
export default vuetify;
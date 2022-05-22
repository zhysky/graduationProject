import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import './plugins/element.js';
import 'normalize.css';

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
    },
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');

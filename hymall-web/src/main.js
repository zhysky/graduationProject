import Vue from 'vue';
import App from './App.vue';
import vuetify from './plugins/vuetify';
import router from './router';
import store from './store';
import './utils';

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app');

// TODO 上传时,文件名不能有#等特殊字符的正则
import Vue from 'vue';
import { required, min, confirmed } from 'vee-validate/dist/rules';
import { extend, ValidationObserver, ValidationProvider, setInteractionMode } from 'vee-validate';

setInteractionMode('eager');

extend('min', {
	...min,
	message: '至少{length}个字符',
});
extend('confirmed', {
	...confirmed,
	message: '两次密码不一样',
});

extend('required', {
	...required,
	message: '不能为空',
});


Vue.mixin({
	components: {
		ValidationObserver,
		ValidationProvider,
	},
});

// Vue.component('ValidationProvider', ValidationProvider);
// Vue.component('ValidationObserver', ValidationObserver);
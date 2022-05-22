import Vue from 'vue';
import Vuex from 'vuex';
import { getToken, setToken, delToken } from '../utils/token';
import { getInfo } from '../api/user';
import { cartTo, cartDel, cartRemove } from '../api/cart';
import { Message } from 'element-ui';


Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    token: getToken(),
    user: JSON.parse(localStorage.getItem('user')) || {
      name: '',
      userInfo: {
        avatar: '',
        email: '',
        phone: '',
        sex: '',
      },
      address: []
    },
    avatar: localStorage.getItem('avatar') || '',
    cartArr: JSON.parse(localStorage.getItem('cartArr')) || [],
    cartSelection: JSON.parse(localStorage.getItem('cartSelection')) || [],
    order: ''
  },



  mutations: {
    token(state, token) {
      Vue.prototype.$set(state, 'token', token);
      setToken(token);
    },
    userName(state, name) {
      Vue.prototype.$set(state.user, 'name', name);
      localStorage.setItem('user', name);
    },
    userInfo(state, info) {
      Vue.prototype.$set(state.user, 'userInfo', info);
      state.avatar = state.user.userInfo.avatar;
      localStorage.setItem('avatar', state.avatar);
    },
    userAddress(state, address) {
      Vue.prototype.$set(state.user, 'address', address.address);
    },

    logout: state => {
      state.token = '';
      state.user = {};
      state.cartArr = [];
      state.cartSelection = [];
      delToken();
      localStorage.removeItem('user');
      localStorage.removeItem('cartArr');
      localStorage.removeItem('cartSelection');
    },

    cartArr: (state, cart) => {
      state.cartArr = cart;
    },
    cartSelection: (state, cart) => {
      localStorage.setItem('cartSelection', JSON.stringify(cart));
      state.cartSelection = cart;
    },

    toCart: (state, { id, title, cover, price, num }) => {
      const index = state.cartArr.findIndex(item => (item.good_id ? item.good_id : '') === id);
      if (index === -1) {
        state.cartArr.push({
          good_id: id,
          title,
          cover,
          price,
          num
        });
      } else {
        state.cartArr[index].num += num;
      }
    },
    cartAdd: (state, index) => {
      state.cartArr[index].num++;
    },
    cartReduce: (state, index) => {
      if (state.cartArr[index].num <= 1) return;
      state.cartArr[index].num--;
    },
    cartInput: (state, { index, num }) => {
      if (num <= 1) {
        state.cartArr[index].num = 1;
      }
      state.cartArr[index].num = num;
    },
    cartRemove: (state, index) => {
      state.cartArr.splice(index, 1);
    },
    delCart(state) {
      state.cartArr = [];
    },
    order(state, order) {
      state.order = order;
    }
  },


  actions: {
    async login({ commit, state }, res) {
      commit('token', res.token);
      commit('userName', res.username);
      const { data: { userInfo, address, cart } } = await getInfo();
      commit('cartArr', cart);
      commit('userInfo', userInfo);
      commit('userAddress', address);
      localStorage.setItem('user', JSON.stringify(state.user));
    },

    async updateInfo({ commit, state }) {
      const { data: { userInfo, address } } = await getInfo();
      commit('userInfo', userInfo);
      commit('userAddress', address);
      localStorage.setItem('user', JSON.stringify(state.user));
    },



    async updateNum({ state }, index) {
      const { num, price, title, cover, good_id } = state.cartArr[index];
      cartTo({
        good_id,
        title,
        cover,
        price,
        num
      });
    },

    async toCart({ dispatch, commit, state }, payload) {
      if (!getToken()) {
        Message.error('请先登录');
        return;
      }
      commit('toCart', payload);
      const index = state.cartArr.findIndex(item => (item.good_id === payload.id));
      dispatch('updateNum', index);
    },

    async cartReduce({ dispatch, commit }, index) {
      commit('cartReduce', index);
      dispatch('updateNum', index);
    },

    async cartAdd({ dispatch, commit }, index) {
      commit('cartAdd', index);
      dispatch('updateNum', index);
    },

    async cartInput({ dispatch, commit }, { index,
      num }) {
      commit('cartInput', {
        index,
        num
      });
      dispatch('updateNum', index);
    },

    async cartRemove({ dispatch, commit, state }, index) {
      await cartRemove(state.cartArr[index]);
      commit('cartRemove', index);
    },

    async delCart({ dispatch, commit }) {
      commit('delCart');
      await cartDel();
    },

    async clearCart({ dispatch, commit, state }) {
      for (let index = state.cartSelection.length - 1; index >= 0; index--) {
        const good = state.cartSelection.pop();
        const i = state.cartArr.findIndex(item => (item.good_id === good.good_id));
        dispatch('cartRemove', i);
      }
      commit('cartSelection', []);
    },
  },


  modules: {
  },


  getters: {
    isLogin: (state) => {
      return !!state.token;
    },
    cartNum: state => {
      let num = 0;
      state.cartArr.map(item => {
        num += item.num;
      });
      return num;
    }
  }
});



store.subscribe((mutations, state) => {
  localStorage.setItem('cartArr', JSON.stringify(state.cartArr));
});
export default store;
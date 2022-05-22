import Vue from 'vue';
import VueRouter from 'vue-router';


import { Home, Main, Search, Details, Cart, Order, Profile, About, Login, Register } from '../views';
import { getToken } from '../utils';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    component: Main,
    redirect: '/home',
    meta: { isPublic: true },
    children: [
      {
        path: 'home',
        name: 'home',
        component: Home,
        meta: { isPublic: true },
      },
      {
        path: 'search/cate/:id',
        name: 'searchCate',
        component: Search,
        meta: { isPublic: true },
        props: true
      },
      {
        path: 'search/good/:goodName',
        name: 'searchGood',
        component: Search,
        meta: { isPublic: true },
        props: true
      },
      {
        path: 'details/:id',
        name: 'details',
        component: Details,
        meta: { isPublic: true },
        props: true
      },
      {
        path: 'cart',
        name: 'cart',
        component: Cart
      },
      {
        path: 'order',
        name: 'order',
        component: Order
      },
      {
        path: 'profile',
        name: 'profile',
        component: Profile,
        props: true
      },
    ]
  },
  {
    path: '/about',
    name: 'about',
    component: About,
    meta: { isPublic: true },
  },

  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: { isPublic: true },
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta: { isPublic: true },
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  if (!to.meta.isPublic && !getToken()) {
    return next('/login');
  }
  next();
});

export default router;

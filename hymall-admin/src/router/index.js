import Vue from 'vue';
import VueRouter from 'vue-router';
import store from '../store';

import { CarouselAdd, CarouselList, CategoryAdd, CategoryList, GoodAdd, GoodEdit, GoodList, Login, Main } from '../views';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    component: Main,
    redirect: '/category/create',
    children: [
      {
        path: 'category/create',
        component: CategoryAdd,
      },
      {
        path: 'category/list',
        component: CategoryList,
      },

      {
        path: 'good/create',
        component: GoodAdd,
      },
      {
        path: 'good/list',
        component: GoodList,
      },
      {
        path: 'good/edit/:id',
        component: GoodEdit,
        props: true,
      },
      {
        path: 'carousel/create',
        component: CarouselAdd,
      },
      {
        path: 'carousel/list',
        component: CarouselList,
      },
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { isPublic: true }
  }
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  if (!to.meta.isPublic && !store.state.token) {
    return next('/login');
  }
  next();
});
export default router;
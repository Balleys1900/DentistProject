import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'LoginPage',
    component: () => import('@/views/LoginPage.vue'),
    beforeEnter: (to, from, next) => {
      if (localStorage.getItem('user')) next({ name: 'Dashboard' });
      else next();
    },
  },
  {
    path: '/dash-board',
    name: 'Dashboard',
    component: () => import('@/views/Dashboard.vue'),
    beforeEnter: (to, from, next) => {
      if (!localStorage.getItem('user')) next({ name: 'LoginPage' });
      else next();
    },
    children: [
      {
        path: '',
        name: 'Home',
        component: () => import('@/components/dashboard/Home.vue'),
      },
      {
        path: 'clinic',
        name: 'Clinic',
        component: () => import('@/components/dashboard/Clinic.vue'),
      },
      {
        path: 'booking',
        name: 'Booking',
        component: () => import('@/components/dashboard/Booking.vue'),
      },
      {
        path: 'discount',
        name: 'Discount',
        component: () => import('@/components/dashboard/Discount.vue'),
      },
    ],
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;

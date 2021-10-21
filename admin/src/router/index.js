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
        component: () => import('@/pages/dashboard/Home.vue'),
      },
      {
        path: 'clinic',
        name: 'Clinic',
        component: () => import('@/pages/dashboard/Clinic.vue'),
        children: [
          {
            path: 'edit/:id',
            name: 'Clinic Detail',
            component: () => import('@/pages/clinic/FormClinic.vue'),
          },
          {
            path: 'add',
            name: 'Add Clinic',
            component: () => import('@/pages/clinic/FormClinic.vue'),
          },
        ],
      },
      {
        path: 'user',
        name: 'User',
        component: () => import('@/pages/dashboard/User.vue'),
      },
      {
        path: 'setting',
        name: 'Setting',
        component: () => import('@/pages/dashboard/Setting.vue'),
      },
      {
        path: 'booking',
        name: 'Booking',
        component: () => import('@/pages/dashboard/Booking.vue'),
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

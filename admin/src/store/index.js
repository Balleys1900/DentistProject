import Vue from 'vue';
import Vuex from 'vuex';
import clinic from './clinic/index';
import user from './user/index';
Vue.use(Vuex);

export default new Vuex.Store({ modules: { clinic, user } });

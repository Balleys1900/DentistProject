import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    clinic: null,
  },
  mutations: {
    SET_CLINIC(state, payload) {
      state.clinic = payload;
    },
  },
  getters: {
    clinic(state) {
      return state.clinic;
    },
  },
  actions: {},
  modules: {},
});

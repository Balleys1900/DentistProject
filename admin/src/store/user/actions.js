import { checkLogin, getAllUser } from '../../api/user';
export default {
  async checkLogin({ commit }, payload) {
    try {
      const res = await checkLogin({ user: payload });
      if (res.status === 200) {
        commit('SET_USER', res.data.data);
        return true;
      }
    } catch (error) {
      return false;
    }
  },
  async getUsers({ commit }) {
    try {
      const res = await getAllUser();
      if (res.status === 200) {
        commit('SET_USERS', res.data.data);
      }
      return res.data;
    } catch (error) {
      return false;
    }
  },
};

import { getClinics, createNewClinic, deleteClinic, modifyClinic } from '../../api/clinic';

export default {
  async getAllClinics({ commit }) {
    const clinics = await getClinics();
    commit('SET_CLINICS', clinics.data);
    return clinics.data;
  },
  async addClinic({ dispatch }, payload) {
    const res = await createNewClinic({ clinic: payload });
    if (res.status === 201) {
      dispatch('getAllClinics');
      return true;
    }
    return false;
  },
  async updateClinic({ dispatch }, payload) {
    const res = await modifyClinic({ clinic: payload });
    if (res.status === 200) {
      dispatch('getAllClinics');
      return true;
    }
    return false;
  },
  async deleteClinic({ dispatch }, payload) {
    const res = await deleteClinic({ id: payload });
    if (res.status === 204) {
      dispatch('getAllClinics');
      return true;
    }
    return false;
  },
};

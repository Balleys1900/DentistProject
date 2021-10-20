import { getAllBooking } from '../../api/booking';

export default {
  async getBookings({ commit }) {
    const orders = await getAllBooking();
    commit('SET_ORDERS', orders.data);
    return orders.data;
  },
};

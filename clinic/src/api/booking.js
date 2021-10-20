import request from '../utils/request';

export function getAllBookingByClinicID(clinicID) {
  return request({
    url: `/order/clinic/${clinicID}`,
    method: 'GET',
  });
}

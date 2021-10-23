import request from '../utils/request';

export function getAllVoucher() {
  return request({
    url: '/vouchers',
    method: 'GET',
  });
}
export function getAllVoucherByClinicID(clinicID) {
  return request({
    url: `/vouchers/${clinicID}`,
    method: 'GET',
  });
}
export function createNewVoucher(data) {
  return request({
    url: '/vouchers',
    method: 'POST',
    data,
  });
}

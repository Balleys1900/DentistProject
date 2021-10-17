import request from '../utils/request';

export function getAllBooking() {
  return request({
    url: '/order',
    method: 'GET',
  });
}

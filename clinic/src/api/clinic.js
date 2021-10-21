import request from '../utils/request';

export function getClinic(username) {
  return request({
    url: `/clinics/username/${username}`,
    method: 'GET',
  });
}
export function updateClinic(data) {
  return request({
    url: '/clinics',
    method: 'PUT',
    data,
  });
}
export function addClinic(data) {
  return request({
    url: '/clinics',
    method: 'POST',
    data,
  });
}

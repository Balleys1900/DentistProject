import request from '../utils/request';

export function getClinic(username) {
  return request({
    url: `/clinics/username/${username}`,
    method: 'GET',
  });
}
export function updateClinicService(data) {
  return request({
    url: '/clinics/services',
    method: 'PUT',
    data,
  });
}
export function addClinicService(data) {
  return request({
    url: '/clinics/services',
    method: 'POST',
    data,
  });
}
export function deleteClinicService(data) {
  return request({
    url: '/clinics/services',
    method: 'DELETE',
    data,
  });
}

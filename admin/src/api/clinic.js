import request from '../utils/request';

export function getClinics() {
  return request({
    url: '/clinics',
    method: 'GET',
  });
}

export function getClinicsRequest() {
  return request({
    url: '/clinics/request',
    method: 'GET',
  });
}
export function createNewClinic(data) {
  return request({
    url: '/clinics',
    method: 'POST',
    data,
  });
}
export function modifyClinic(data) {
  return request({
    url: '/clinics',
    method: 'PUT',
    data,
  });
}

export function updateStatus(data) {
  return request({
    url: '/clinics/status',
    method: 'PUT',
    data,
  });
}

export function deleteClinic(data) {
  return request({
    url: '/clinics',
    method: 'DELETE',
    data,
  });
}

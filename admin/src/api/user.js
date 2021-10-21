import request from '../utils/request';

export function checkLogin(data) {
  return request({
    url: '/users/login',
    method: 'POST',
    data,
  });
}

export function getAllUser() {
  return request({
    url: '/users',
    method: 'GET',
  });
}

export function updateStatus(data) {
  return request({
    url: '/users/status',
    method: 'PUT',
    data,
  });
}

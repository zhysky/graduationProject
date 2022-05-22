import http from './http';

export async function getGoodList(skip, take) {
  return http.get('/good/page', {
    'params': {
      skip,
      take,
    },
  });
}

export async function getGood(id) {
  return await http.get('/good/one', {
    'params': { id },
  });
}

export async function addGood(goodForm) {
  return await http.post('/good/add', goodForm);
}

export async function updateGood(id, goodForm) {
  return await http.put(`/good/update/${id}`, goodForm);
}

export async function deleteGood(id) {
  return http.delete(`/good/del/${id}`);
}
import store from '../store';
import http from '../utils/http';

export async function getNewGoods() {
    return await http.get('/good/new');
}

export async function getRecommedGoods() {
    return await http.get('/good/recommed')
}

export async function getSelectGoods() {
    return await http.get('/good/select');
}

export async function getGoodDetail(id) {
    return await http.get(`/good/detail/${id}`);
}

export async function getGoodByName(name, skip, take) {
    return await http.get('/good/search', {
        params: {
            goodName: name,
            skip,
            take,
            order: store.state.order
        }
    });
}
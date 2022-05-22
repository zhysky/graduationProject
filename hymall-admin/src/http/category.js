import http from './http';

export async function getCategoriesTree() {
	return await http.get('/category/list_tree');
}

export async function getCategoriesList(skip, take) {
	return http.get('/category/page', {
		params: {
			skip,
			take
		}
	});
}

// export async function getCategories() {
// 	return await http.get('/category/list');
// }

export async function getGoodByCategory(cate) {
	return await http.get(`/category/good/${cate}`);
}

export async function addCategory(parentCategory, newCategory) {
	return await http.post('/category/add', {
		parentCategory,
		newCategory
	});
}

export async function deleteCategory(id) {
	return http.delete(`/category/del/${id}`);
}


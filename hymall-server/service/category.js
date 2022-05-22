import { getConnection, getTreeRepository } from 'typeorm';
import Category from '../entity/Category.entity';
import Good from '../entity/Good.entity';

export async function getCategoryTreeAll() {
	const ct = getTreeRepository(Category);
	const trees = await ct.findTrees();
	return trees;
}

export async function getGoodByCategory(id, skip, take, order) {
	const category = await Category.findOne(id);
	const goods = await Good.findAndCount({
		where: {
			category
		},
		order: {
			price: order,
		},
		relations: ['category'],
		skip,
		take,
		cache: true
	});
	return goods;
}

export async function getCategoryTreeByPage(skip, take) {
	const ct = getTreeRepository(Category);
	return await ct.findAndCount({
		relations: ['parent'],
		select: ['id', 'name', 'createdDate'],
		order: {
			createdDate: 'DESC',
			id: 'DESC'
		},
		skip,
		take,
		cache: true
	});
}

export async function addCategory(parentCategory, newCategory) {
	const parent = await Category.findOne(parentCategory);
	const newCate = new Category(newCategory);
	newCate.name = newCategory;
	newCate.parent = parent;
	await Category.save(newCate);
	return ({
		code: 1,
		message: 'Category create successfully'
	});
}

export async function delCategory(id) {
	const ct = getTreeRepository(Category);
	const category = await ct.findOne(id, { relations: ['children', 'goods'], });
	if (!(category.goods.length === 0)) {
		return ({
			code: 0,
			message: 'This category have goods, can not be deleted'
		});
	}
	if (!(category.children.length === 0)) {
		return ({
			code: 0,
			message: 'This category is parent of other category , can not be deleted'
		});
	} else {
		await getConnection()
			.createQueryBuilder()
			.delete()
			.from('category_closure')
			.where('id_descendant = :id', { id: id })
			.execute();
		await ct.delete(id);
		return ({
			code: 1,
			message: 'Category delete successfully'
		});
	}
}
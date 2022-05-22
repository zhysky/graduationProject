import Good from '../entity/Good.entity';
import Category from '../entity/Category.entity';
import { Like } from 'typeorm';


export async function getGoodByPage(skip, take) {
	return await Good.findAndCount({
		relations: ['category'],
		order: {
			updatedDate: 'DESC',
			id: 'DESC'
		},
		skip,
		take,
		cache: true
	});
}
export async function getGoodByName(goodName, skip, take, order) {
	return await Good.findAndCount({
		where: {
			name: Like(`%${goodName}%`)
		},
		order: {
			price: order,
		},
		skip,
		take,
		cache: true
	});
}

export async function getGood(id) {
	return await Good.findOne(id, {
		relations: ['category', 'goodInfo'],
	});
}

export async function getGoodByCategory(id) {
	return await Good.findOne(id, {
		relations: ['category', 'goodInfo'],
	});
}

export async function getNewGood() {
	return await Good.find({
		where: { tag: '新货上架' }
	});
}

export async function getRecommedGood() {
	return await Good.find({
		where: { tag: '商家推荐' }
	});
}

export async function getSelectGood() {
	return await Good.find({
		where: { tag: '精选好货' }
	});
}

export async function getGoodDetail(id) {
	return await Good.findOne(id, {
		relations: ['goodInfo']
	});
}

export async function addGood(good, category) {
	const parCate = await Category.findOne(category);
	const newGood = Good.create(good);
	newGood.category = parCate;
	await Good.save(newGood);
	return ({
		code: 1,
		message: 'Good create successfully'
	});
}

export async function updateGood(id, good, category) {
	let parCate = await Category.find({ id: category.id });
	let updateGood = await Good.findOne(id);
	updateGood = {
		...updateGood,
		...good
	};
	updateGood.category = parCate[0];
	await Good.save(updateGood);
	return ({
		code: 1,
		message: 'Good update successfully'
	});
}

export async function delGood(id) {
	await Good.delete(id);
	return ({
		code: 1,
		message: 'Good delete successfully'
	});
}
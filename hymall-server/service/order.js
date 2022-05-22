import Order from '../entity/Order.entity';
import User from '../entity/User.entity';


export async function createOrder({ user, total, goods, post, address, payment_type, createTime }) {
	const uuser = await User.findOne({ name: user }, {
		relations: ['order']
	});

	const newOrder = Order.create();
	newOrder.total = total;
	newOrder.goods = goods;
	newOrder.payment_type = payment_type;
	newOrder.address = address;
	newOrder.post = post;
	newOrder.createTime = createTime;

	uuser.order = [...uuser.order, newOrder];
	User.save(uuser);
}

export async function getOrderByPage(user, skip, take) {
	const uuser = await User.findOne({ name: user });
	const oo = await Order.findOneOrFail({
		user: uuser,
	}).catch(e => null);
	if (uuser && oo) {
		return await Order.findAndCount({
			where: {
				user: uuser,
			},
			order: {
				createTime: 'DESC',
				id: 'DESC'
			},
			skip,
			take,
			cache: true
		});
	} else {
		return {
			orders: [],
			count: 0
		};
	}
}

export async function getAllOrderByPage(skip, take) {
	return await Order.findAndCount({
		relations: ['user'],
		order: {
			createTime: 'DESC',
			id: 'DESC'
		},
		skip,
		take,
		cache: true
	});
}
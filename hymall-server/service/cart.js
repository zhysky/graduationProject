import Cart from '../entity/Cart.entity';
import User from '../entity/User.entity';



export async function cartTo(user, cart) {
	const uuser = await User.findOne({ name: user }, {
		relations: ['cart']
	});

	const index = uuser.cart.findIndex(item => (item.good_id === cart.good_id));
	if (index === -1) {
		const newCart = Cart.create(cart);
		uuser.cart = [...uuser.cart, newCart];
	} else {
		uuser.cart[index].num = cart.num;
	}
	User.save(uuser);
}

export async function cartDel(user) {
	const uuser = await User.findOne({ name: user });
	const carts = await Cart.find({ userId: uuser.id });
	Cart.remove(carts);
}

export async function cartRemove(user, cart) {
	const uuser = await User.findOne({ name: user });
	const carts = await Cart.find({
		where: {
			userId: uuser.id,
			good_id: cart.good_id
		}
	});
	Cart.remove(carts);
}
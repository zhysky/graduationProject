import User from '../entity/User.entity';
import UserInfo from '../entity/UserInfo.entity';
import Address from '../entity/Address.entity';

export async function findByName(name) {
	return await User.find(name);
}
export async function findOne(name) {
	return await User.findOne({ name }, {
		relations: ['userInfo', 'address']
	});
}

export async function addUser(user) {
	const newUser = User.create(user);
	newUser.userInfo = UserInfo.create();
	newUser.userInfo.avatar = '';
	newUser.address = Address.create();
	newUser.address.address = [];

	await User.save(newUser);
	await User.findOne({ name: newUser.name }, {
		relations: ['order']
	});

	return User.save(newUser);
}

export function verifyPassword(password, hash) {
	return User.verifyPassword(password, hash);
}

export async function getInfo(name) {
	return await User.findOne({ name }, {
		relations: ['userInfo', 'address', 'cart']
	});
}

export async function updateInfo(user, userInfo) {
	user.userInfo = {
		...user.userInfo,
		...userInfo
	};
	return User.save(user);
}

export async function updateAddress(user, address) {
	user.address.address = address;
	return User.save(user);
}
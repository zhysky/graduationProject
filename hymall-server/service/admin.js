import Admin from '../entity/Admin.entity';

export async function getAdminList() {
	return await Admin.find();
}
export async function getAdminOne(adminName) {
	return await Admin.findOne({ name: adminName });
}
export async function addAdmin() {
	return await Admin.insert({
		name: 'admin',
		password: '123456'
	});
}
export async function getlist() {
	return await Admin.find();
}
export async function verifyPassword(password, hash) {
	return Admin.verifyPassword(password, hash);
}


import bcrypt from 'bcryptjs';
import { BeforeInsert, Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import Address from './Address.entity';
import Base from './Base';
import Cart from './Cart.entity';
import Order from './Order.entity';
import UserInfo from './UserInfo.entity';

export default 
@Entity()
 class User extends Base {
	@Column('varchar', {
		nullable: true
	})
	name = '';

	@Column('varchar')
	password = '';

	@OneToOne(type => UserInfo, userInfo => userInfo.user, {
		cascade: true
	})
	@JoinColumn()
	userInfo;
	// 关联userinfo

	@OneToOne(type => Address, address => address.user, {
		cascade: true
	})
	@JoinColumn()
	address;
	// 关联address

	@OneToMany(type => Cart, cart => cart.user, {
		cascade: true
	})
	cart;
	// 关联购物车

	@OneToMany(type => Order, order => order.user, {
		cascade: true
	})
	order;
	// 关联订单

	@BeforeInsert()
	createPassword() {
		this.password = bcrypt.hashSync(this.password, 10);
	}

	static verifyPassword(password, hash) {
		return bcrypt.compareSync(password, hash);
	}
}
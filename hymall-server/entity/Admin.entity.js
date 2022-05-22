import bcrypt from 'bcryptjs';
import { BeforeInsert, BeforeUpdate, Column, Entity } from 'typeorm';
import Base from './Base';

export default
@Entity()
class Admin extends Base {
	@Column('varchar', {
		nullable: true
	})
	name = '';

	@Column('varchar')
	password = '';

	@BeforeInsert()
	createPassword() {
		this.password = bcrypt.hashSync(this.password, 10);
	}
	@BeforeUpdate()
	updatePassword() {
		this.password = bcrypt.hashSync(this.password, 10);
	}

	static verifyPassword(password, hash) {
		return bcrypt.compareSync(password, hash);
	}
}
import { Column, Entity, OneToOne } from 'typeorm';
import Base from './Base';
import User from './User.entity';

export default
@Entity()
class Address extends Base {
	@OneToOne(type => User, user => user.address)
	user;

	@Column('json', {
		nullable: true
	})
	address;
}
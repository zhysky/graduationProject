import { Column, Entity, ManyToOne } from 'typeorm';
import Base from './Base';
import User from './User.entity';

@Entity()
export default 
class Cart extends Base {
	@Column('int', {
		nullable: true
	})
	num = '';

	@Column('int', {
		nullable: true
	})
	price = '';

	@Column('varchar', { nullable: true })
	good_id;

	@Column('varchar', { nullable: true })
	cover;

	@Column('varchar', { nullable: true })
	title;

	@ManyToOne(type => User, user => user.cart)
	user;
}
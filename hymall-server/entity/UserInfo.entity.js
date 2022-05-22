import { Column, Entity } from 'typeorm';
import Base from './Base';

export default 
@Entity()
 class UserInfo extends Base {

	@Column('varchar', {
		nullable: true
	})
	avatar = '';

	@Column('varchar', {
		nullable: true
	})
	email = '';

	@Column('varchar', {
		nullable: true
	})
	sex = '';

	@Column('varchar', {
		nullable: true
	})
	phone = '';
}


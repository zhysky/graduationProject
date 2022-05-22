import { Entity, Column } from 'typeorm';
import Base from './Base';

@Entity()
class Carousel extends Base {
	@Column('varchar')
	good_id;

	@Column('varchar')
	good_name;

	@Column('varchar')
	src;
}

export default Carousel;
import { Column, Entity, OneToOne } from 'typeorm';
import Base from './Base';
import Good from './Good.entity';

export default
@Entity()
 class GoodInfo extends Base {
	@Column('int', {
		nullable: true,
		'default': 9999
	})
	inventory = '';
	// 库存

	@Column('int', {
		nullable: true,
		'default': 9999
	})
	sales = '';
	// 销量

	@Column('json', {
		nullable: true
	})
	pictures = '';
	// 图片

	@Column('varchar', {
		nullable: true
	})
	describe = '';
	// 描述

	@Column('text', {
		nullable: true
	})
	details = '';
	// 详情

	@OneToOne(type => Good, good => good.goodInfo)
	good;
}
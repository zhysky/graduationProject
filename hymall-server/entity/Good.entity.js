import { Column, Entity, JoinColumn, ManyToOne, OneToOne } from 'typeorm';
import Base from './Base';
import Category from './Category.entity';
import GoodInfo from './GoodInfo.entity';

export default 
@Entity()
class Good extends Base {
	@Column('varchar', {
		nullable: true
	})
	name = '';

	@Column('varchar', {
		nullable: true
	})
	cover = '';
	// 封面图

	@Column('float', {
		nullable: true,
		'default': 9
	})
	price = '';

	@Column('varchar', {
		nullable: true,
		'default': '默认'
	})
	tag = '';
	// 标签

	@OneToOne(type => GoodInfo, goodInfo => goodInfo.good, {
		cascade: true
	})
	@JoinColumn()
	goodInfo;
	// 关联goodInfo

	@ManyToOne(type => Category, category => category.goods)
	category;
	// 关联分类
}
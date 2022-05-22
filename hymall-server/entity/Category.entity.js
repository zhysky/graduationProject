import { Column, Entity, OneToMany, Tree, TreeChildren, TreeParent } from 'typeorm';
import Base from './Base';
import Good from './Good.entity';

export default 
@Entity()
@Tree('closure-table')
class Category extends Base {
	@Column('varchar', {
		nullable: true
	})
	name = '';

	@Column('varchar', {
		nullable: true,
		select: false,
		'default': 0
	})
	level;

	@TreeChildren()
	children = undefined;

	@TreeParent()
	parent = undefined;

	@OneToMany(type => Good, good => good.category)
	goods;
	// 关联商品
}


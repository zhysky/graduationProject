import { Column, Entity, ManyToOne } from 'typeorm';
import Base from './Base';
import User from './User.entity';

export default 
@Entity()
 class Order extends Base {
  @Column('float', {
    nullable: true
  })
  total = '';

  @Column('varchar', {
    nullable: true
  })
  payment_type = '';

  @Column('varchar', {
    nullable: true
  })
  post = '';

  @Column('json', { nullable: true })
  address = '';

  @Column('varchar', { nullable: true })
  createTime = '';

  @Column('json', { nullable: true })
  goods;
  // 将整个cart的内容作为json

  @ManyToOne(type => User, user => user.order)
  user;
}
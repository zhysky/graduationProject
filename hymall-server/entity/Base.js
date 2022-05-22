import { BaseEntity, CreateDateColumn, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm';

export default class Base extends BaseEntity {
	@PrimaryGeneratedColumn('uuid')
	id = undefined;

	@CreateDateColumn({ select: false })
	createdDate;

	@UpdateDateColumn()
	updatedDate;
}
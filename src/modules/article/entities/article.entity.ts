import { ApiProperty } from '@nestjs/swagger'
import { Column, Entity } from 'typeorm'

import { CommonEntity } from '~/common/entity/common.entity'

@Entity({ name: 'article' })
export class ArticleEntity extends CommonEntity {
  @Column({ type: 'varchar', length: 128 })
  @ApiProperty({ description: '标题' })
  title: string

  @Column({ type: 'text' })
  @ApiProperty({ description: '内容' })
  content: string

  @Column({ type: 'varchar', length: 50, nullable: true })
  @ApiProperty({ description: '路径' })
  path: string

  @Column({ type: 'int', default: 0, nullable: true })
  @ApiProperty({ description: '访问数量' })
  visitCount: number
}

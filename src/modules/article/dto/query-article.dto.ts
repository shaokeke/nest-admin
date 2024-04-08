import { ApiProperty } from '@nestjs/swagger'
import { IsNumber, IsOptional, IsString, MinLength } from 'class-validator'

import { PagerDto } from '~/common/dto/pager.dto'

export class ArticelDto {
  @ApiProperty({ description: '标题' })
  @IsString()
  title: string

  @ApiProperty({ description: '路径' })
  @IsString()
  @MinLength(3)
  path: string

  @ApiProperty({ description: '访问数量' })
  @IsNumber()
  visitCount: number
}

export class ArticelQueryDto extends PagerDto {
  @ApiProperty({ description: '标题' })
  @IsString()
  @IsOptional()
  title: string
}

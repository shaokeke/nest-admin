import { ApiProperty } from '@nestjs/swagger'
import { IsString, MaxLength, MinLength } from 'class-validator'

export class CreateArticleDto {
  @ApiProperty({ description: '标题' })
  @IsString()
  @MinLength(3)
  title: string

  // @ApiProperty({ description: '路径' })
  // @IsString()
  // path?: string

  @ApiProperty({ description: '内容' })
  @IsString()
  @MinLength(1)
  @MaxLength(4096)
  content: string
}

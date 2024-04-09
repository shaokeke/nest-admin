import { Body, Controller, Delete, Get, Param, Post, Query } from '@nestjs/common'

import { ApiOperation, ApiTags } from '@nestjs/swagger'

import { ApiResult } from '~/common/decorators/api-result.decorator'
import { IdParam } from '~/common/decorators/id-param.decorator'
import { ApiSecurityAuth } from '~/common/decorators/swagger.decorator'
import { Pagination } from '~/helper/paginate/pagination'
import { ArticleEntity } from '~/modules/article/entities/article.entity'
import { Perm, definePermission } from '~/modules/auth/decorators/permission.decorator'

import { ArticleService } from './article.service'
import { CreateArticleDto } from './dto/create-article.dto'
import { ArticelQueryDto } from './dto/query-article.dto'
import { UpdateArticleDto } from './dto/update-article.dto'

export const permissions = definePermission('article:manage', {
  LIST: 'list',
  CREATE: 'create',
  READ: 'read',
  UPDATE: 'update',
  DELETE: 'delete',
} as const)

@ApiTags('Blog - 文章管理模块')
@ApiSecurityAuth()
@Controller('article')
export class ArticleController {
  constructor(private readonly articleService: ArticleService) {}

  @Post()
  @ApiOperation({ summary: '新增文章' })
  @Perm(permissions.CREATE)
  async create(@Body() createArticleDto: CreateArticleDto): Promise<void> {
    await this.articleService.create(createArticleDto)
  }

  @Get()
  @ApiOperation({ summary: '获取文章列表' })
  @ApiResult({ type: [ArticleEntity], isPage: true })
  @Perm(permissions.LIST)
  async list(@Query() dto: ArticelQueryDto): Promise<Pagination<ArticleEntity>> {
    return this.articleService.page(dto)
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.articleService.findOne(+id)
  }

  @Post(':id')
  @ApiOperation({ summary: '更新文章' })
  @Perm(permissions.UPDATE)
  async update(@IdParam() id: number, @Body() updateArticleDto: UpdateArticleDto): Promise<void> {
    await this.articleService.update(id, updateArticleDto)
  }

  @Delete(':id')
  @ApiOperation({ summary: '删除文章' })
  @Perm(permissions.DELETE)
  async delete(@IdParam() id: number) {
    return this.articleService.delete(id)
  }
}

import { Module } from '@nestjs/common'
import { TypeOrmModule } from '@nestjs/typeorm'

import { ArticleEntity } from '~/modules/article/entities/article.entity'

import { ParamConfigModule } from '../system/param-config/param-config.module'

import { ArticleController } from './article.controller'

import { ArticleService } from './article.service'

@Module({
  imports: [TypeOrmModule.forFeature([ArticleEntity]), ParamConfigModule],
  controllers: [ArticleController],
  providers: [ArticleService],
})
export class ArticleModule {}

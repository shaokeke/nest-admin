import path from 'node:path'

import {
  Injectable,
  Logger,
  OnModuleInit,

} from '@nestjs/common'

import { InjectRepository } from '@nestjs/typeorm'
import { FSWatcher, watch } from 'chokidar'
import { Repository } from 'typeorm'

import { BusinessException } from '~/common/exceptions/biz.exception'
import { ErrorEnum } from '~/constants/error-code.constant'
import { ARTICLE_PATH } from '~/constants/system.constant'

import { paginate } from '~/helper/paginate'
import { Pagination } from '~/helper/paginate/pagination'
import { ArticleEntity } from '~/modules/article/entities/article.entity'

import {
  differenceBy,
  fileExists,
  filePathRename,
  formatToDateTime,
  getFilesRecursively,
  readFileToString,
  saveStringToFile,
  toUnderline,
} from '~/utils'

import { ParamConfigService } from '../system/param-config/param-config.service'

import { CreateArticleDto } from './dto/create-article.dto'
import { ArticelQueryDto } from './dto/query-article.dto'
import { UpdateArticleDto } from './dto/update-article.dto'

@Injectable()
export class ArticleService implements OnModuleInit {
  watcher: FSWatcher
  articlePath: string
  async onModuleInit() {
    // 在这里编写你的启动脚本
    Logger.debug('Module has been initialized. Running script...')
    // 执行你的脚本代码

    const articlePath = await this.paramConfigService.findValueByKey(
      ARTICLE_PATH,
    )
    console.log('articlePath', articlePath)
    if (articlePath) {
    // 监听的文件夹路径
      const pathToWatch = 'E:/project/vue/vue3-antdv-admin/docs'
      // 在主线程中启动chokidar监听
      // watch(pathToWatch).on('all', (event, path) => {
      //   // console.log('event', event, 'path:', path)
      //   Logger.debug('event', event, 'path:', path)
      // })
      this.articlePath = articlePath
      this.runWatchDirectory()
    }
    else {
      Logger.error('articlePath没有配置')
    }
  }

  constructor(
    @InjectRepository(ArticleEntity)
    private articleRepository: Repository<ArticleEntity>,
    private readonly paramConfigService: ParamConfigService,
  ) {}

  async runWatchDirectory() {
    Logger.log(this.articlePath, 'runWatchDirectory')
    await this.writeArticleFileInfoToDataBase(this.articlePath)
    this.watcher = watch(this.articlePath, {
      persistent: true,
      ignoreInitial: true,
      awaitWriteFinish: true,
    })
    this.watcher
      .on('add', async (path) => {
        Logger.log(`File ${path} was added`)
        await this.writeArticleFileInfoToDataBase(this.articlePath)
      })
      .on('change', async (path) => {
        console.log(`File ${path} was changed`)
        // 更新这个文件的信息
        await this.writeArticleFileInfoToDataBase(this.articlePath)
      })
      .on('unlink', path => console.log(`File ${path} was removed`))
      .on('error', error => console.error(`Watcher error: ${error}`))
    // .on('ready', () => console.log('Initial scan complete. Ready for changes.'))
  }

  /**
   * 罗列所有文章
   */
  async page({
    page,
    pageSize,
    title,
    field = 'id',
    order,
  }: ArticelQueryDto): Promise<Pagination<ArticleEntity>> {
    const queryBuilder = this.articleRepository.createQueryBuilder('a') // 指定article別名为a

    if (title) {
      queryBuilder.where('a.title LIKE :title', {
        title: `%${title}%`,
      })
    }
    if (field) {
      console.log('order', order)
      console.log('toUnderline(field)', toUnderline(field))
      queryBuilder.orderBy(toUnderline(field), order || 'DESC')
    }

    return paginate(queryBuilder, { page, pageSize })
  }

  async create(createArticleDto: CreateArticleDto) {
    // 1.创建md文件
    // 2.入库
    console.log('CreateArticleDto', createArticleDto.title)

    if (this.isValidFileName(createArticleDto.title))
      throw new BusinessException(ErrorEnum.INVALID_ARTICLE_TITLE)

    const articlePath = await this.paramConfigService.findValueByKey(
      ARTICLE_PATH,
    )
    const mdPath = path.join(articlePath, `${createArticleDto.title}.md`)
    console.log('fileExists', await fileExists(mdPath))
    try {
      if (!await fileExists(mdPath)) {
        // 将字符串写入文件，如果文件已存在则替换，不存在则创建
        saveStringToFile(mdPath, createArticleDto.content)
      }
      else {
        // result.status = 1
        // result.msg = '文章标题已存在！'
        throw new BusinessException(ErrorEnum.ARTICLE_EXISTS)
      }
    }
    catch (error) {
      throw new Error(error)
    }
    await this.articleRepository.insert(createArticleDto)
    console.log('CreateArticleDto', createArticleDto.content)
  }

  async saveFile(newTitle: string, content: string, oldTitle: string): Promise<void> {
    if (this.isValidFileName(newTitle))
      throw new BusinessException(ErrorEnum.INVALID_ARTICLE_TITLE)
    if (this.isValidFileName(oldTitle))
      throw new BusinessException(ErrorEnum.INVALID_ARTICLE_TITLE)
    const articlePath = await this.paramConfigService.findValueByKey(
      ARTICLE_PATH,
    )
    const newMdPath = path.join(articlePath, `${newTitle}.md`)
    const oldMdPath = path.join(articlePath, `${oldTitle}.md`)
    console.log('fileExists', await fileExists(newMdPath), await fileExists(oldMdPath))
    try {
      // 源文件存在，则改名然后写入
      if (await fileExists(oldMdPath)) {
        if (oldMdPath === newMdPath) {
          // 直接写入
          await saveStringToFile(oldMdPath, content)
        }
        else {
          // 改名后写入1
          // await this.watcher.close()
          console.log('移除监听文件夹')
          await filePathRename(oldMdPath, newMdPath)
          await saveStringToFile(newMdPath, content)
          // this.runWatchDirectory()
        }
      }
      else {
        throw new BusinessException(ErrorEnum.ARTICLE_NOT_FOUND)
      }
    }
    catch (error) {
      throw new Error(error)
    }
  }

  findAll() {
    return `This action returns all article`
  }

  findOne(id: number) {
    return `This action returns a #${id} article`
  }

  async update(id: number, updateArticleDto: UpdateArticleDto): Promise<void> {
    // 1.找出原来的oldTitle
    const oldArticle = await this.articleRepository.findOneBy({ id })
    console.log('oldArticle', oldArticle)
    if (!oldArticle)
      throw new BusinessException(ErrorEnum.ARTICLE_NOT_FOUND)

    await this.articleRepository.update(id, updateArticleDto)
    await this.saveFile(updateArticleDto.title, updateArticleDto.content, oldArticle.title)
  }

  remove(id: number) {
    return `This action removes a #${id} article`
  }

  async updateArticleBatch(articleList: Array<ArticleEntity>): Promise<void> {
    const articlesOld: Array<ArticleEntity> = await this.articleRepository.find()
    // 新数据中有的而旧数据中没有的就是需要insert的数据 差集
    const toInsert: Array<ArticleEntity> = differenceBy(articleList, articlesOld, 'title')
    // 旧数据中有的而新数据中没有的就是需要delete的数据
    const toDelete: Array<ArticleEntity> = differenceBy(articlesOld, articleList, 'title')

    if (toDelete.length > 0)
      await this.articleRepository.softDelete(toDelete.map(item => item.id))

    if (toInsert.length > 0)
      await this.articleRepository.insert(toInsert)

    // console.log('articlesOld', articlesOld)
    // console.log('updateArticleBatch', articleList)
  }

  private isValidFileName(title: string): boolean {
    const reg = /[\\\/:*?"<>|]/
    // const regExp = new RegExp('[\\\\/:*?\"<>|]')
    return reg.test(title)
  }

  private async writeArticleFileInfoToDataBase(articlePath: string): Promise<void> {
    const mdFiles: string[] = getFilesRecursively(articlePath, '.md')

    Logger.log(mdFiles, `mdFiles:`)
    const articleList: Array<ArticleEntity> = []
    for (const mdFile of mdFiles) {
      let createTime = null
      const s: string = await readFileToString(mdFile)
      if (s !== '' && s.includes('date:')) {
        const s1 = s.split('date:')[1]
        // console.log('s1', s1)
        let dateString: string

        if (s1.includes('\n'))
          dateString = s1.substring(0, s1.indexOf('\n')).trim()
          // 如果文件只有一行的情况
        else
          dateString = s1

        createTime = formatToDateTime(dateString)
      }
      // console.log('createTime', createTime)
      const fileName = path.basename(mdFile)
      const article = new ArticleEntity()
      article.title = fileName.substring(0, fileName.lastIndexOf('.md'))
      if (createTime)
        article.createdAt = createTime
      if (s)
        article.content = s
      articleList.push(article)
    }
    await this.updateArticleBatch(articleList)
  }
}

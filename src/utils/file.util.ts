import fs from 'node:fs'
import path from 'node:path'

import { MultipartFile } from '@fastify/multipart'

import dayjs from 'dayjs'

enum Type {
  IMAGE = '图片',
  TXT = '文档',
  MUSIC = '音乐',
  VIDEO = '视频',
  OTHER = '其他',
}

export function getFileType(extName: string) {
  const documents = 'txt doc pdf ppt pps xlsx xls docx'
  const music = 'mp3 wav wma mpa ram ra aac aif m4a'
  const video = 'avi mpg mpe mpeg asf wmv mov qt rm mp4 flv m4v webm ogv ogg'
  const image
    = 'bmp dib pcp dif wmf gif jpg tif eps psd cdr iff tga pcd mpt png jpeg'
  if (image.includes(extName))
    return Type.IMAGE

  if (documents.includes(extName))
    return Type.TXT

  if (music.includes(extName))
    return Type.MUSIC

  if (video.includes(extName))
    return Type.VIDEO

  return Type.OTHER
}

export function getName(fileName: string) {
  if (fileName.includes('.'))
    return fileName.split('.')[0]

  return fileName
}

export function getExtname(fileName: string) {
  return path.extname(fileName).replace('.', '')
}

export function getSize(bytes: number, decimals = 2) {
  if (bytes === 0)
    return '0 Bytes'

  const k = 1024
  const dm = decimals < 0 ? 0 : decimals
  const sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']

  const i = Math.floor(Math.log(bytes) / Math.log(k))

  return `${Number.parseFloat((bytes / k ** i).toFixed(dm))} ${sizes[i]}`
}

export function fileRename(fileName: string) {
  const name = fileName.split('.')[0]
  const extName = path.extname(fileName)
  const time = dayjs().format('YYYYMMDDHHmmSSS')
  return `${name}-${time}${extName}`
}

export function getFilePath(name: string, currentDate: string, type: string) {
  return `/upload/${currentDate}/${type}/${name}`
}

export async function saveLocalFile(buffer: Buffer, name: string, currentDate: string, type: string) {
  const filePath = path.join(__dirname, '../../', 'public/upload/', `${currentDate}/`, `${type}/`)
  try {
    // 判断是否有该文件夹
    await fs.promises.stat(filePath)
  }
  catch (error) {
    // 没有该文件夹就创建
    await fs.promises.mkdir(filePath, { recursive: true })
  }
  const writeStream = fs.createWriteStream(filePath + name)
  writeStream.write(buffer)
}

export async function saveFile(file: MultipartFile, name: string) {
  const filePath = path.join(__dirname, '../../', 'public/upload', name)
  const writeStream = fs.createWriteStream(filePath)
  const buffer = await file.toBuffer()
  writeStream.write(buffer)
}

export async function deleteFile(name: string) {
  fs.unlink(path.join(__dirname, '../../', 'public', name), () => {
    // console.log(error);
  })
}

// 检查文件是否存在于给定路径
export async function fileExists(filePath: string): Promise<boolean> {
  let exist = true
  try {
    await fs.promises.access(filePath, fs.constants.F_OK)
  }
  catch (error) {
    // 没有该文件夹就创建
    exist = false
  }
  return exist

  // return new Promise((resolve, reject) => {
  //   fs.access(filePath, fs.constants.F_OK, (err) => {
  //     if (err) {
  //       console.error('文件不存在')
  //       resolve(false)
  //     }
  //     else {
  //       // 文件存在
  //       console.log('文件存在')
  //       resolve(true)
  //     }
  //   })
  // })
}

export async function saveStringToFile(path: string, content: string) {
  fs.promises.writeFile(path, content, 'utf8')
}

export async function readFileToString(path: string) {
  return fs.promises.readFile(path, 'utf8')
}
/**
 * 递归获取指定文件夹下的所有.txt文件
 * @param folderPath 文件夹路径
 * @param fileExt 文件扩展名
 * @returns 文件路径数组
 */
export function getFilesRecursively(folderPath: string, fileExt: string): string[] {
  let files: string[] = []
  const dirEntries = fs.readdirSync(folderPath, { withFileTypes: true })

  dirEntries.forEach((dirEntry) => {
    const fullPath = path.join(folderPath, dirEntry.name)
    if (dirEntry.isDirectory())
      files = [...files, ...getFilesRecursively(fullPath, fileExt)] // 递归子目录
    else if (path.extname(fullPath) === fileExt)
      files.push(fullPath) // 添加匹配扩展名的文件路径
  })

  return files
}

import { customAlphabet, nanoid } from 'nanoid'

import { md5 } from './crypto.util'

export function getAvatar(mail: string | undefined) {
  if (!mail)
    return ''

  return `https://cravatar.cn/avatar/${md5(mail)}?d=retro`
}

export function generateUUID(size: number = 21): string {
  return nanoid(size)
}

export function generateShortUUID(): string {
  return nanoid(10)
}

/**
 * 生成一个随机的值
 */
export function generateRandomValue(
  length: number,
  placeholder = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM',
): string {
  const customNanoid = customAlphabet(placeholder, length)
  return customNanoid()
}

/**
 * 生成一个随机的值
 */
export function randomValue(
  size = 16,
  dict = 'useandom-26T198340PX75pxJACKVERYMINDBUSHWOLF_GQZbfghjklqvwyzrict',
): string {
  let id = ''
  let i = size
  const len = dict.length
  while (i--) id += dict[(Math.random() * len) | 0]
  return id
}

export const hashString = function (str, seed = 0) {
  let h1 = 0xDEADBEEF ^ seed
  let h2 = 0x41C6CE57 ^ seed
  for (let i = 0, ch; i < str.length; i++) {
    ch = str.charCodeAt(i)
    h1 = Math.imul(h1 ^ ch, 2654435761)
    h2 = Math.imul(h2 ^ ch, 1597334677)
  }
  h1
    = Math.imul(h1 ^ (h1 >>> 16), 2246822507)
    ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909)
  h2
    = Math.imul(h2 ^ (h2 >>> 16), 2246822507)
    ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909)
  return 4294967296 * (2097151 & h2) + (h1 >>> 0)
}

export const uniqueSlash = (path: string) => path.replace(/(https?:\/)|(\/)+/g, '$1$2')

// 取差集
export function differenceBy(arr1: Array<any>, arr2: Array<any>, key: string) {
  const set2 = new Set(arr2.map(item => item[key]))
  return arr1.filter(item => !set2.has(item[key]))
}

// 驼峰转下划线
export function toUnderline(str: string) {
  return str.replace(/([A-Z])/g, '_$1').toLowerCase()
}

export function deleteCharAt(str: string, index: number) {
  if (index >= 0 && index < str.length)
    return str.slice(0, index) + str.slice(index + 1)
  return str // 如果索引超出字符串范围，则返回原字符串
}

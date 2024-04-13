import { exec } from 'node:child_process'

import { type SpawnSyncReturns, spawnSync } from 'node:child_process'

import { Logger } from '@nestjs/common'

const maxBuffer = 20 * 1024 * 1024

export function execute(command: string) {
  exec(command, (error, stdout, stderr) => {
    Logger.log(`command: ${command}`)
    if (error) {
      Logger.error(`执行的错误: ${error}`)
      return
    }
    Logger.log(`stdout: ${stdout}`)
    if (stderr)
      Logger.log(`stderr: ${stderr}`)
  })
}

export function executeSpawn(
  cmd: string,
  args: string[] = [],
): SpawnSyncReturns<string> {
  // args from shelljs
  let res = null
  const result = spawnSync(cmd, args, { maxBuffer, encoding: 'utf8' })
  console.log('result', result)
  if (result.status === 0)
    res = result.stdout

  return res
}

import { exec } from 'node:child_process'

import { Logger } from '@nestjs/common'

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

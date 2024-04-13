import { ChildProcessWithoutNullStreams, exec } from 'node:child_process'
import { type SpawnSyncReturns, spawn, spawnSync } from 'node:child_process'

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

export function executeSpawnSync(
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

// 配置项
const EXECUTION_OPTIONS = {
  windowsHide: true, // windows命令行不显示
  detached: true, // 让子进程独立于父进程运行
}

let childProcess: ChildProcessWithoutNullStreams
// 启动服务端程序
export function executeSpawn(cmd: string, args: string[] = []) {
  childProcess = spawn(cmd, args, EXECUTION_OPTIONS)
  console.log('childProcess', childProcess)
}

// 关闭服务端程序
export function stopSpawn() {
  console.log(childProcess.pid)
  /**
   * 注意：想要关闭启动的进程，必须使用 spawn 来创建子进程，
   *      使用 exec 创建子进程无法使用 kill 方法关闭子进程：
   *      因为 exec 创建子进程的实例实际上不是子进程，而是套壳进程，
   *      无法获取子进程的 pid，而是在子进程的外部套壳，获取的是套壳进程的 pid
   */
  /**
   * @param 1. childProcess.exitCode 标识子进程的退出代码。如果子进程仍在运行，则返回 null
   * @param 2. childProcess.kill() 通过调用 kill 方法来杀掉进程
   */
  if (childProcess.exitCode === null) {
    childProcess.kill()
    console.log('Attempting to gracefully shut down the C++ service...')
  }
  else {
    console.log('C++ service has already exited.')
  }
}

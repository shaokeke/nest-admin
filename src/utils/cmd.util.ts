import { ChildProcess, SpawnOptions, type SpawnSyncReturns, exec, spawn, spawnSync } from 'node:child_process'
import os from 'node:os'

import { Logger } from '@nestjs/common'
import dayjs from 'dayjs'

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
  // stdio: [0,1,2], // stdin stdout stderr
  windowsHide: true, // windows命令行不显示
  detached: true, // 让子进程独立于父进程运行
}

let childProcess: ChildProcess
// 启动服务端程序
export function executeSpawn(cmd: string, args: string[] = []) {
  childProcess = spawn(cmd, args, EXECUTION_OPTIONS)
  console.log('childProcess', childProcess.pid)
  hanldeSpawn()
}

function hanldeSpawn() {
  childProcess!.stdout.on('data', (data) => {
    // Handle data...
    console.log('childProcess data', String(data))
  })

  // childProcess!.stderr.on("data", (err) => {
  //   // Handle error...
  //   console.log("childProcess err", String(err))
  // });

  childProcess.on('exit', (code) => {
    // Handle exit
    console.log('childProcess exit', code)
  })
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

interface CmdOption extends SpawnOptions {
  silent?: boolean
  logPrefix?: string
}
export const EXECUT_OPTIONS = {
  silent: true, // 忽略一些错误
  logPrefix: '',
  windowsHide: true, // windows命令行不显示
  detached: false, // 让子进程独立于父进程运行
  shell: true,
}
export class Cmd {
  private text: string = ''

  runNodeModule(moduleName: string, params?: string[], options?: CmdOption): Promise<string> {
    if (os.type() === 'Windows_NT' && !moduleName.match(/\.cmd$/))
      moduleName += '.cmd'

    return this.run(moduleName, params, options)
  }

  run(command: string, params?: string[], options?: CmdOption): Promise<string> {
    this.text = ''

    return new Promise((resolve: (data: string) => void, reject: (error: Error) => void) => {
      console.log(`run command: ${command}, params:`, params, options)

      if (!options)
        options = {}

      if (!params)
        params = []
      options.stdio = 'pipe'
      const proc = spawn(command, params, options)

      proc.stdout!.on('data', (data) => {
        let dataStr = String(data)
        if (options?.logPrefix)
          dataStr = options.logPrefix + dataStr

        this.text += dataStr
        if (!options?.silent)
          process.stdout.write(dayjs().format('HH:mm:ss:SSS ') + dataStr)
      })

      proc.stderr!.on('data', (data) => {
        // 不一定代表进程exitcode != 0，可能只是进程调用了console.error
        let dataStr = String(data)
        if (options?.logPrefix)
          dataStr = options.logPrefix + dataStr

        if (!options?.silent)
          process.stderr.write(dayjs().format('HH:mm:ss:SSS ') + dataStr)
      })

      // 进程错误
      proc.on('error', (error: Error) => {
        if (!options?.silent)
          console.error(error)
        reject(error)
      })

      // 进程关闭
      proc.on('close', (code: number) => {
        console.log(`process closed with exit code: ${code}`)
        if (code === 0) {
          resolve(this.text || '')
        }
        else {
          let errMsg = `process closed with exit code: ${code}`
          if (options?.logPrefix)
            errMsg = options.logPrefix + errMsg

          reject(new Error(errMsg))
        }
      })

      proc.on('exit', (code: number | null, signal: NodeJS.Signals | null) => {
        console.log(`process exits`)
      })
    })
  }
}

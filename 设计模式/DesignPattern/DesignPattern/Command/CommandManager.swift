//
//  CommandManager.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/6.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class CommandManager: NSObject {

    var arrayCommands = [Command]()
    
    static var shareInstance = CommandManager()
    
    /// 执行命令
    class func executeCommand(cmd: Command, completion: CommandCompletionCallBack?) {
        if isExecutingCommand(cmd: cmd) == false {
            // 加到数组
            shareInstance.arrayCommands.append(cmd)
            // 命令执行完成后，回调
            cmd.completion = completion
            // 执行命令
            cmd.execute()
        }
    }
    
    /// 取消命令
    class func cancelCommand(cmd: Command) {
        shareInstance.arrayCommands.removeAll(where: { $0 == cmd })
        
        cmd.cancel()
    }
    
    /// 判断是否正在执行当前命令
    class func isExecutingCommand(cmd: Command?) -> Bool {
        if cmd != nil {
            let cmds = shareInstance.arrayCommands
            for aCmd in cmds {
                if cmd == aCmd {
                    return true;
                }
            }
        }
        return false
    }
}

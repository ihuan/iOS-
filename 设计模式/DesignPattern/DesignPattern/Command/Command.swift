//
//  Command.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/6.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

typealias CommandCompletionCallBack = (_ cmd: Command) -> ()

class Command: NSObject {

    var completion: CommandCompletionCallBack?
    
    func execute() {
        DispatchQueue.main.async {
            if self.completion != nil {
                self.completion!(self)
            }
            self.completion = nil
            CommandManager.shareInstance.arrayCommands.removeAll(where: { $0 == self })
        }
    }
    
    func cancel() {
        completion = nil
    }
    
}

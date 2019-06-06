//
//  ViewController.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/5.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 责任链模式
        //testResponder()
        
        // 桥接
        //testBridge()
        
        // 命令
        testCommand()
    }

}

extension ViewController {
    
    func testResponder() {
        let businessA = BusinessA()
        let businessB = BusinessB()
        let businessC = BusinessC()
        
        businessC.nextBusiness = businessA
        businessA.nextBusiness = businessB
        businessC.handle { (handler, handled) in
            print("A,B,C业务逻辑都已经处理完成，这里可以通过‘责任链’对三个业务逻辑随意调整次序！")
        }
    }
    
    func testBridge() {
        // Table2 加载网络数据 DataB1
        let tableA2 = TableA2()
        tableA2.baseData = DataB1()
        tableA2.handle()
        
        print("============分割线============")
        
        // Table1 加载网络数据 DataB2
        let tableA1 = TableA1()
        tableA1.baseData = DataB2()
        tableA1.handle()
        
    }
    
    func testCommand() {
        let command01 = Command()
        let command02 = Command()
        CommandManager.executeCommand(cmd: command01) { (cmd) in
            print("执行命令01")
        }
        CommandManager.cancelCommand(cmd: command01)
        CommandManager.executeCommand(cmd: command02) { (cmd) in
            print("执行命令02")
        }
    }
}

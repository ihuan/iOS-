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
        
        let businessA = BusinessA()
        let businessB = BusinessB()
        let businessC = BusinessC()
        
        businessC.nextBusiness = businessA
        businessA.nextBusiness = businessB
        businessC.handle { (handler, handled) in
            print("A,B,C业务逻辑都已经处理完成，这里可以通过‘责任链’对三个业务逻辑随意调整次序！")
        }
    }

}


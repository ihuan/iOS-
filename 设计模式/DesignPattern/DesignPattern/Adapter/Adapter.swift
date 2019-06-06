//
//  Adapter.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/6.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class Adapter: NSObject {

    /// 被适配对象
    var target: Target?
    
    /// 对原有方法包装
    func request() {
        // 额外处理
        target?.operation()
        // 额外处理
    }
    
}

//
//  BaseTable.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/5.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class BaseTable {

    // 桥接模式的核心实现
    var baseData: BaseData?
    
    public func handle() {
        // 具体怎么获取网络数据，由子类完成
        baseData?.fetchData()
    }
}

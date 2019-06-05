//
//  BusinessBase.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/5.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class BusinessBase {
    
    // 下一个响应者
    public var nextBusiness: BusinessBase?
    
    typealias CompletionBlock = (Bool) -> ()
    typealias ResultBlock = (BusinessBase?, Bool) -> ()
    
    // 响应者的处理方法
    public func handle(result: @escaping ResultBlock) {
        let completion: CompletionBlock =  { (handled) in
            if (handled) {
                result(self.nextBusiness, handled)
            } else {
                if (self.nextBusiness != nil) {
                    self.nextBusiness?.handle(result: result)
                } else {
                    result(nil, false)
                }
            }
        }
        self.handleBusiness(completion: completion)
    }
    
    // 各个业务仔该方法中的实际业务处理
    public func handleBusiness(completion: CompletionBlock) {
        completion(false)
    }
    
}

//
//  Person.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

struct Person: ExpressibleByArrayLiteral {
    var name: String = ""
    var id: String = ""
    
    typealias ArrayLiteralElement = String
    
    init(arrayLiteral elements: String...) {
        if elements.count == 2 {
            name = elements[0]
            id = elements[1]
        }
    }
}

extension Person: Equatable {
    static func == (p1: Person, p2: Person) -> Bool {
        return p1.id == p2.id
    }
}



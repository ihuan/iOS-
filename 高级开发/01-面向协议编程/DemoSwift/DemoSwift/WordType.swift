//
//  WordType.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

// 协议继承
protocol WordType: CustomStringConvertible {
    var name: String {
        get
    }
    var pronunciation: String {
        get
    }
    var definition: String {
        get
    }
    
    func record()
    
    func testExtension()
}

protocol Speakable {
    func speak()
}

// 协议组合
typealias SpeakableWordType = WordType & Speakable

// 协议扩展
extension WordType {
    func testExtension() {
        print("协议扩展")
    }
}

struct KingsoftWord: WordType {
    var name: String
    
    var pronunciation: String
    
    var definition: String
    
    var description: String {
        return "\(name), \(pronunciation), \(definition)"
    }
    
    func record() {
        
    }
    
    
}

struct YoudaoWord: WordType {
    
    var name: String
    
    var pronunciation: String
    
    var definition: String
    
    var description: String {
        return "\(name), \(pronunciation), \(definition)"
    }
    
    func record() {
        
    }
    
}

struct BaiduWord: WordType {

    var name: String
    
    var pronunciation: String
    
    var definition: String
    
    var description: String {
        return "\(name), \(pronunciation), \(definition)"
    }
    
    func record() {
        print("Baidu record")
    }
    
    
}

//
//  TNThemeManager.swift
//  ThemeDemo
//
//  Created by Tonio on 2019/6/14.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

typealias tnBlock = (_ theme: String) -> (UIColor)

class TNThemeManager: NSObject {

    var themeDict: [String: [String: Any]?]?
    
    static let shared = TNThemeManager()
    
    private override init() {
        super.init()
        // 加载主题文件
        loadThemeFile(fileName: "themeColorTable")
        // 设置当前主题
        currentTheme = "NORMAL"
    }
    
    var currentTheme: String? {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "themeChanging"), object: nil)
        }
    }
    
    func loadThemeFile(fileName: String) {
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        guard let pathG = path else {
            return;
        }
        var dict = NSDictionary(contentsOfFile: pathG) as! [String: [String: Any]]
        for (d_key, d_value) in dict {
            var subDic = d_value
            for (s_key, s_value) in subDic {
                let colorString = s_value as! String
                // 字符转颜色
                subDic[s_key] = colorString.stringToUIColor as Any
            }
            dict[d_key] = subDic
        }
        self.themeDict = dict
    }
    
    // 获取当前主题颜色
    func getCurrentColor(theme: String) -> UIColor? {
        let dict = themeDict?[theme]
        let color = dict??[currentTheme!] as! UIColor
        return color
    }
    
    // Block 方式
    func getThemeColor(theme: String) -> tnBlock {
        let dic = themeDict?[theme]
        let tnBlock: tnBlock = { (currentTheme: String?) in
            return dic??[currentTheme!] as! UIColor
        }
        return tnBlock
    }
}

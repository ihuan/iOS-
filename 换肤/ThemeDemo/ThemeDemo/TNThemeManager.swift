//
//  TNThemeManager.swift
//  ThemeDemo
//
//  Created by Tonio on 2019/6/14.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class TNThemeManager: NSObject {

    var themeDict: [String: [String: UIColor]?]?
    
    static var shared: TNThemeManager {
        let themeManager = TNThemeManager()
        // 加载主题文件
        loadThemeFile(fileName: "themeColorTable")
        // 设置当前主题
        themeManager.currentTheme = "NORMAL"
        return themeManager
    }
    
    var currentTheme: String? {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "themeChanging"), object: nil)
        }
    }
    
    static func loadThemeFile(fileName: String) {
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        guard let pathG = path else {
            return;
        }
        let dict = NSDictionary(contentsOfFile: pathG) as! [String: [String: Any]]
        for d in dict {
            var subDic = d.value
            for sd in subDic {
                let colorString = sd.value as! String
                // 字符转颜色
                subDic[sd.key] = colorString.stringToUIColor
            }
        }
    }
    
    // 获取当前主题颜色
    func getCurrentColor(theme: String) -> UIColor? {
        let dict = themeDict?[theme]
        let color = dict??[currentTheme!]
        return color
    }
 
}

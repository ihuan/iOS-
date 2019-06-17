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
        
        // 设置当前主题
        themeManager.currentTheme = "NORMAL"
        return themeManager
    }
    
    var currentTheme: String? {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "themeChanging"), object: nil)
        }
    }
    
    func loadThemeFile(fileName: NSString?) {
        
    }
    
    // 获取当前主题颜色
    func getCurrentColor(theme: String) -> UIColor? {
        let dict = themeDict?[theme]
        let color = dict??[currentTheme!]
        return color
    }
 
}

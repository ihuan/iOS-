//
//  ViewController.swift
//  ThemeDemo
//
//  Created by Tonio on 2019/6/14.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let themeBtn = UIButton.init(type: .custom)
        themeBtn.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        themeBtn.center = view.center
        themeBtn.setTitleColor(UIColor.lightGray, for: .highlighted)
        themeBtn.setTitleColor(UIColor.white, for: [])
        themeBtn.setTitle("点击", for: [])
        themeBtn.addTarget(self, action: #selector(changeThemeAction), for: .touchUpInside)
        themeBtn.tnBackGroundColor = TNThemeManager.shared.getCurrentColor(theme: "BG")
//        themeBtn.backgroundColor = UIColor(red: 34/255, green: 232/255, blue: 23/255, alpha: 1.0)
        view.addSubview(themeBtn)
        
    }

    @objc func changeThemeAction() {
        print("改变主题")
        TNThemeManager.shared.currentTheme = "NIGHT"
    }
    
    deinit {
        print("what")
    }
}


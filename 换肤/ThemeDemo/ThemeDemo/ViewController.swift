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
        
        self.view.backgroundColor = UIColor.darkGray
        
        let themeBtn = UIButton.init(type: .custom)
        themeBtn.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        themeBtn.center = view.center
        themeBtn.setTitleColor(UIColor.lightGray, for: .highlighted)
        themeBtn.setTitleColor(UIColor.black, for: [])
        themeBtn.setTitle("点击", for: [])
        themeBtn.addTarget(self, action: #selector(changeThemeAction), for: .touchUpInside)
        themeBtn.tnBackGroundColor = TNThemeManager.shared.getCurrentColor(theme: "BG")
        themeBtn.layer.cornerRadius = 5.0
//        themeBtn.backgroundColor = UIColor(red: 34/255, green: 232/255, blue: 23/255, alpha: 1.0)
        view.addSubview(themeBtn)
        
    }

    @objc func changeThemeAction() {
        print("改变主题")
        if TNThemeManager.shared.currentTheme == "RED" {
            TNThemeManager.shared.currentTheme = "NIGHT"
        } else {
            TNThemeManager.shared.currentTheme = "RED"
        }
    }
    
    deinit {
        print("what")
    }
}


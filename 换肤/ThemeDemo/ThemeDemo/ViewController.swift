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
        themeBtn.backgroundColor = UIColor.red
//        themeBtn.tnBackGroundColor = TNThemeManager.shared.getCurrentColor(theme: "BG")
        view.addSubview(themeBtn)
        
    }

    @objc func changeThemeAction() {
        print("改变主题")
        TNThemeManager.shared.currentTheme = "RED"
    }
    
    deinit {
        print("what")
    }
}


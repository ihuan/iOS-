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
        
        var bgView: UIView = {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 64*2)
            v.backgroundColor = v.superview?.backgroundColor
            v.center = view.center
            return v
        }()
        view.addSubview(bgView)
        
        var bgViewt: UIView {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 64*2)
            v.backgroundColor = v.superview?.backgroundColor
            v.center = view.center
            return v
        }
        
        let margin = 24
        let btnRect = 100
        for i in 0..<18 {
            let themeBtn = UIButton.init(type: .custom)
            themeBtn.frame = CGRect(x: (i%3 + 1)*margin + ((i)%3)*(btnRect),
                                    y: (i/3+1)*(margin) + (i/3)*(btnRect),
                                    width: btnRect,
                                    height: btnRect)
            themeBtn.setTitleColor(UIColor.lightGray, for: .highlighted)
            themeBtn.setTitleColor(UIColor.black, for: [])
            themeBtn.setTitle("更改主题", for: [])
            themeBtn.addTarget(self, action: #selector(changeThemeAction), for: .touchUpInside)
            themeBtn.tnBackGroundColor = TNThemeManager.shared.getCurrentColor(theme: "BG")
            themeBtn.layer.cornerRadius = 5.0
            bgView.addSubview(themeBtn)
        }
        
      
    }

    @objc func changeThemeAction() {
        if TNThemeManager.shared.currentTheme == "NORMAL" {
            TNThemeManager.shared.currentTheme = "NIGHT"
        } else if TNThemeManager.shared.currentTheme == "NIGHT" {
            TNThemeManager.shared.currentTheme = "RED"
        } else {
            TNThemeManager.shared.currentTheme = "NORMAL"
        }
    }
}


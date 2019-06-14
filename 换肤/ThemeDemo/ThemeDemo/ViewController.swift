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
        themeBtn.backgroundColor = UIColor.purple
        view.addSubview(themeBtn)
        
    }


}


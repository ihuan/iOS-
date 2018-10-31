//
//  ViewController.swift
//  03-绘图
//
//  Created by LTH on 2018/10/30.
//  Copyright © 2018 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cgView = CGView.init(frame: CGRect(x: 0,
                                               y: 0,
                                               width: view.frame.width - 20,
                                               height: view.frame.height - 40))
        cgView.backgroundColor = UIColor.purple
        cgView.center = view.center
        view.addSubview(cgView)
    }


}


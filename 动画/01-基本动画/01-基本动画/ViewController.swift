//
//  ViewController.swift
//  01-基本动画
//
//  Created by LTH on 2018/10/15.
//  Copyright © 2018 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func moveImage(_ sender: Any) {
        switch (sender as! UIButton).tag {
        case 100:
            print("Up")
        case 101:
            print("Right")
        case 102:
            print("Down")
        case 103:
            print("Left")
        default:
            print("Nothing to do!")
        }
    }
    
}


//
//  ViewController.swift
//  01-基本动画
//
//  Created by LTH on 2018/10/15.
//  Copyright © 2018 Tony. All rights reserved.
//

import UIKit

let moveMargin: CGFloat = 20

class ViewController: UIViewController {
    
    private lazy var image = UIImageView(image: UIImage(named: "logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    /// 移动图片
    @IBAction func moveImage(_ sender: Any) {
        switch (sender as! UIButton).tag {
        case 100:
            print("Up")
            image.frame.origin.y -= moveMargin
        case 101:
            print("Right")
            image.frame.origin.x += moveMargin
        case 102:
            print("Down")
            image.frame.origin.y += moveMargin
        case 103:
            print("Left")
            image.frame.origin.x -= moveMargin
        default:
            print("Nothing to do!")
        }
    }
    
    /// 缩放
    @IBAction func scaleImage(_ sender: Any) {
        switch (sender as! UIButton).tag {
        case 104:
            print("放大")
            image.frame.size.width += moveMargin
            image.frame.size.height += moveMargin
        case 105:
            print("缩小")
            image.frame.size.width -= moveMargin
            image.frame.size.height -= moveMargin
        default:
            print("Nothing to do!")
        }
    }
    
}

private extension ViewController {
    func configUI() {
       
        image.center = view.center
        image.frame.origin.y = 20
        view.addSubview(image)
    }
}

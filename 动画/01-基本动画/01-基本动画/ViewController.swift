//
//  ViewController.swift
//  01-基本动画
//
//  Created by LTH on 2018/10/15.
//  Copyright © 2018 Tony. All rights reserved.
//

import UIKit

let moveMargin: CGFloat = 100

class ViewController: UIViewController {
    
    private lazy var image = UIImageView(image: UIImage(named: "logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    @IBAction func moveImage(_ sender: Any) {
        // 移动
        switch (sender as! UIButton).tag {
        case 100:
            UIView.animate(withDuration: 2) {
                self.image.frame.origin.y -= moveMargin
                // 如果想让属性不执行动画可以
                UIView.performWithoutAnimation {
                    //self.image.alpha = 0
                }
            }
        case 101:
            image.frame.origin.x += moveMargin
        case 102:
            self.image.frame.origin.y += moveMargin
        case 103:
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
    
    @IBAction func reset() {
        image.center = view.center
    }
    
}

private extension ViewController {
    func configUI() {
        image.center = view.center
        view.addSubview(image)
    }
}

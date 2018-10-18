//
//  ViewController.swift
//  01-基本动画
//  参考: https://www.jianshu.com/p/71f2fa270b9c
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
        switch (sender as! UIButton).tag {
        // 移动
        case 100:
            UIView.animate(withDuration: 2) {
                self.image.frame.origin.y -= moveMargin
                // 如果想让属性不执行动画可以
                UIView.performWithoutAnimation {
                    //self.image.alpha = 0
                }
            }
        // 循环
        case 101:
            // options：一个附加选项，UIViewAnimationOptions 可以指定多个
            //let opts = UIView.AnimationOptions.autoreverse 来回一次
            let opts: UIView.AnimationOptions = [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat]
            UIView.animate(withDuration: 2, delay: 0, options: opts, animations: {
                self.image.frame.origin.x += moveMargin
            }) { (_) in
                self.image.center = self.view.center
            }
        // 翻转 transform, 就是旋转平移缩放，可以叠加一起使用
        case 102:
            UIView.animate(withDuration: 2) {
                self.image.transform = CGAffineTransform.identity
                    .translatedBy(x: -100, y: 0)
                    .rotated(by: CGFloat(Double.pi/4))
                    .scaledBy(x: 0.5, y: 0.5)
            }
        // Spring 弹簧
        case 103:
            UIView.animate(withDuration: 2,
                           delay: 0, 
                           usingSpringWithDamping: 0.3, // 振幅，越小，晃动的越缓和
                           initialSpringVelocity: 1, // 初始速度
                           options: [],
                           animations: {
                                self.image.frame.origin.x -= moveMargin
                           },
                           completion: nil)
        // Keyframe 关键帧动画
        case 104:
            var p = self.image.center
            let dur = 0.25
            var start = 0.0
            let dx: CGFloat = -100
            let dy: CGFloat = 50
            var dir: CGFloat = 1
            UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
                    p.x += dx*dir
                    p.y += dy
                    self.image.center = p
                })
                start += dur
                dir *= -1
                UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
                    p.x += dx*dir
                    p.y += dy
                    self.image.center = p
                })
                start += dur
                dir *= -1
                UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
                    p.x += dx*dir
                    p.y += dy
                    self.image.center = p
                })
                start += dur
                dir *= -1
                UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
                    p.x += dx*dir
                    p.y += dy
                    self.image.center = p
                })
            }, completion: nil)
        case 105:
            break
        default:
            print("Nothing to do!")
        }
    }
    
    @IBAction func reset() {
        // 移动还原
        image.center = view.center
        // 翻转还原
        image.transform = CGAffineTransform.identity
        // 重复动画还原
        image.layer.removeAllAnimations()
    }
    
}

private extension ViewController {
    func configUI() {
        image.center = view.center
        view.addSubview(image)
    }
}

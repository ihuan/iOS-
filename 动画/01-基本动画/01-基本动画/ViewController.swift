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
    
    private lazy var myView1: MyView1 = {
        let myView1 = MyView1()
        myView1.backgroundColor = UIColor.lightGray //super.view.backgroundColor
        myView1.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        myView1.center.y = self.view.center.y
        self.view.addSubview(myView1)
        return myView1
    }()
    
    private lazy var lable1: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 90, y: 20, width: 150, height: 150)
        lable.text = "Hello"
        lable.textColor = UIColor.white
        lable.backgroundColor = UIColor.black
        lable.sizeToFit()
        self.view.addSubview(lable)
        return lable
    }()
    
    private lazy var imageAnimView: UIImageView = UIImageView()
    /// 模拟声音控件
    private lazy var imageAnimView1: UIImageView = UIImageView()
    /// 默认录音控件
    private lazy var imageAnimView2: UIImageView = UIImageView()
    
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
        // Keyframe 关键帧动画 - 可以把动画分成一个一个小的阶段
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
        // Transitions 过渡
        case 105:
            // 1. View的Transitions
            
            UIView.transition(with: self.image, duration: 2, options: [.transitionFlipFromLeft], animations: {
                if self.image.image == #imageLiteral(resourceName: "logo") {
                    self.image.image = #imageLiteral(resourceName: "gold")
                } else {
                    self.image.image = #imageLiteral(resourceName: "logo")
                }
            }, completion: nil)
            
            // 2. 自定义view的 Transitions
            UIView.transition(with: self.myView1, duration: 2, options: .transitionFlipFromLeft, animations: {
                self.myView1.setNeedsDisplay()
            }, completion: nil)
            
            // 3. 过渡动画3
            let lab2 = UILabel(frame: self.lable1.frame)
            lab2.text = self.lable1.text == "Hello" ? "World" : "Hello"
            lab2.textColor = UIColor.white
            lab2.sizeToFit()
            UIView.transition(from: self.lable1 , to: lab2 , duration: 0.8 , options: .transitionFlipFromLeft , completion: { _ in
                self.lable1 = lab2
            })
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
    
    // 图片帧的交换， 如果更快就是一个Tom猫了
    @IBAction func imageViewAnimation(_ sender: Any) {
        let goldImage = #imageLiteral(resourceName: "gold")
        let rImage = #imageLiteral(resourceName: "logo")
        imageAnimView.frame = CGRect(x: 20, y: 90, width: 50, height: 50)
        imageAnimView.contentMode = .scaleToFill
        let imgArry = [goldImage, rImage]
        imageAnimView.animationImages = imgArry
        imageAnimView.animationDuration = 2
        imageAnimView.animationRepeatCount = 3
        imageAnimView.startAnimating()
        view.addSubview(imageAnimView)
    }
    
    /*
     // 本身提供了图片的动画播放
     let iv = UIImage.animatedImage(with
     // 动画名字+“0”，直到1024
     let iv = UIImage.animatedImageNamed(name
     */
    @IBAction func imageAnimation1(_ sender: Any) {
        let imageAnim1 = UIImage.animatedImageNamed("voice", duration: 2)
        imageAnimView1.frame = CGRect(x: 20, y: 120, width: 50, height: 50)
        imageAnimView1.image = imageAnim1
        //imageAnimView1.sizeToFit()
        view.addSubview(imageAnimView1)
    }
    
    @IBAction func imageAnimation2(_ sender: Any) {
    
    }
}

private extension ViewController {
    func configUI() {
        image.center = view.center
        view.addSubview(image)
    }
}

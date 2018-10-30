//
//  ViewController.swift
//  02-核心动画
//
//  Created by LTH on 2018/10/18.
//  Copyright © 2018 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLable: UILabel!
    @IBOutlet weak var purpleLable: UILabel!
    @IBOutlet weak var blueLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        // 基本
        //position()
        //positonX()
        //rotation()
        //rotationX()
        //scale()
        //translation()
        //combine()
        //bounds() // 这里有问题
        //size() // 这里有问题
        //sizeW()
        //opacity()
        
        // 关键帧
        //valueKeyframeAni()
        //pathKeyframeAni()
        
        // 转场
        //transitionAni()
        
        // 弹簧
        springAni()
    }
}


// MARK: - 基本动画
private extension ViewController {
    
    // MARK: - position 位置
    func position() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.toValue = NSValue(cgPoint: redLable.center)
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        purpleLable.layer.add(anim, forKey: "PositionAni")
    }
    
    // position.x | position.y
    func positonX() {
        let anim = CABasicAnimation(keyPath: "position.x")
        anim.toValue = NSNumber(value: Float(redLable.center.x))
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        purpleLable.layer.add(anim, forKey: "PositionAniX")
    }
    
    // MARK: - rotation 翻转
    func rotation() {
        let anim = CABasicAnimation(keyPath: "transform")
        anim.duration = 1
        // 参数说明: 角度 - 沿X - Y - Z抽翻
        anim.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi, 0, 0, 1))
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        purpleLable.layer.add(anim, forKey: "rotationAni")
    }
    
    // transform.rotation.x | transform.rotation.y | transform.rotation.z
    func rotationX() {
        let anim = CABasicAnimation(keyPath: "transform.rotation.x")
        anim.duration = 1
        anim.toValue = NSNumber(value: Double.pi)
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        purpleLable.layer.add(anim, forKey: "rotationXAni")
    }
    
    // MARK: - scale 缩放
    func scale() {
        let anim = CABasicAnimation(keyPath: "transform")
        anim.duration = 0.5
        anim.toValue = NSValue.init(caTransform3D: CATransform3DMakeScale(0.7, 0.7, 1.0))
        anim.isRemovedOnCompletion = false
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redLable.layer.add(anim, forKey: "scaleAni")
    }
    
    // MARK: - 平移动
    func translation() {
        let anim = CABasicAnimation(keyPath: "transform")
        anim.duration = 0.5
        anim.toValue = NSValue.init(caTransform3D: CATransform3DMakeTranslation(0, -50, 0))
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        purpleLable.layer.add(anim, forKey: "transformAni")
    }
    
    // MARK: - 组合动画
    func combine() {
        let anim = CABasicAnimation(keyPath: "transform")
        anim.duration = 2.0
        // 多个动画 CATransform3DConcat
        anim.toValue = NSValue.init(caTransform3D:
            CATransform3DConcat(CATransform3DMakeRotation(.pi, 1.0, 0, 0),
                                CATransform3DConcat(CATransform3DMakeTranslation(100, -100, 0),
                                                    CATransform3DMakeScale(0.7, 0.7, 1))
                                ))
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redLable.layer.add(anim, forKey: "transformCombineAni")
    }
    
    // MARK: - bounds
    // bounds.size.width | bounds.size.height |
    func bounds() {
        let anim = CABasicAnimation(keyPath: "bounds")
        anim.duration = 1.0
        anim.fromValue = NSValue.init(cgRect: redLable.bounds)
        anim.toValue = NSValue.init(cgRect: blueLable.bounds)
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redLable.layer.add(anim, forKey: "bounds")
    }
    
    // MARK: - size
    func size() {
        let anim = CABasicAnimation(keyPath: "bounds.size")
        anim.toValue = NSValue.init(cgSize: purpleLable.bounds.size)
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redLable.layer.add(anim, forKey: "sizeAni")
    }
    
    func sizeW() {
        let anim = CABasicAnimation(keyPath: "bounds.size.width")
        anim.toValue = NSNumber.init(value: Float(purpleLable.bounds.width))
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redLable.layer.add(anim, forKey: "sizeWidthAni")
    }
    
    // MARK: - 透明度
    func opacity() {
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.toValue = NSNumber.init(value: 0)
        anim.duration = 2.0
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redLable.layer.add(anim, forKey: "opacityAni")
    }
    
    /*
     其他相关
     1. 背景色
     backgroundColor
     ani.toValue = (id)[UIColor colorWithRed:0.399 green:0.4804 blue:0.9887 alpha:1.0].CGColor;
     
     2. 圆角
     cornerRadius
     ani.toValue = [NSNumber numberWithFloat:self.centerShow.bounds.size.height / 2];
     
     3. 边框
     borderWidth
     ani.toValue = [NSNumber numberWithFloat:5.0];
     
     4. 内容 eg：替换一张图片
     contents
     ani.toValue = (id)[UIImage imageNamed:@"Raffle"].CGImage;
     
     5. 阴影
     shadowColor
     shadowOffset 偏移
     shadowOpacity 透明
     shadowRadius 圆角
     ani.toValue = (id)[UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0].CGColor;
     
     6. others
     */
}

// MARK: - 关键帧
private extension ViewController {
    
    // 正方形运行
    func valueKeyframeAni() {
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.duration = 4.0
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        let value1 = NSValue.init(cgPoint: CGPoint(x: 150, y: 200))
        let value2 = NSValue.init(cgPoint: CGPoint(x: 250, y: 200))
        let value3 = NSValue.init(cgPoint: CGPoint(x: 250, y: 300))
        let value4 = NSValue.init(cgPoint: CGPoint(x: 150, y: 300))
        let value5 = NSValue.init(cgPoint: CGPoint(x: 150, y: 200))
        anim.values = [value1, value2, value3, value4, value5]
        redLable.layer.add(anim, forKey: "PositionKeyFrameValueAni")
    }
    
    // 圆圈运行
    func pathKeyframeAni() {
        let anim = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath.init()
        path.addEllipse(in: CGRect(x: 130, y: 200, width: 100, height: 100))
        anim.path = path
        anim.duration = 4.0
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        redLable.layer.add(anim, forKey: "PostionKeyframePathAni")
    }
    
}

// MARK: - 转场动画 transitionAni
private extension ViewController {
    
    func transitionAni() {
        let anim = CATransition()
//        anim.type = .reveal
        // 私有转场动画: rippleEffect cube  suckEffect
        anim.type = .init(rawValue: "pageCurl")
        anim.subtype = CATransitionSubtype.fromLeft
        anim.duration = 1.5
        redLable.backgroundColor = UIColor.yellow
        redLable.textColor = UIColor.black
        redLable.text = "转场"
        redLable.layer.add(anim, forKey: "transitionAni")
    }
    
}

// MARK: - 弹簧动画
private extension ViewController {
    
    /*
     CASpringAnimation
     可以设置更多影响弹簧动画效果的属性，
     可以实现更复杂的弹簧动画效果，
     且可以和其他动画组合。
     */
    func springAni() {
        let anim = CASpringAnimation(keyPath: "bounds")
        // 质量越大，弹簧拉伸和压缩的幅度越大
        anim.mass = 10.0;
        // 刚度系数越大，形变产生的力就越大，运动越快
        anim.stiffness = 5000
        // 阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
        anim.damping = 100.0
        // 初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
        anim.initialVelocity = 5.0
        anim.fromValue = NSValue.init(cgRect: purpleLable.bounds)
        anim.toValue = NSValue.init(cgRect: redLable.bounds)
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        self.blueLable.layer.add(anim, forKey: "boundsAni")
    }
    
}

// MARK: - 事务
// 事务的作用：保证一个或多个layer的一个或多个属性变化同时进行
// 负责协调多个动画原子更新显示操作
/*
 隐式 - 没有明显调用事务的方法，由系统自动生成事务。
 显式 - 明显调用事务的方法
 */
private extension ViewController {
    
    func testTransaction() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.0)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: .easeInEaseOut))
        // ... 动画
        CATransaction.commit()
        // 注意：只有非root layer才有隐式动画
    }
    
}

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
        opacity()
    }
}

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
}

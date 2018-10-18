//
//  MyView1.swift
//  01-基本动画
//
//  Created by LTH on 2018/10/18.
//  Copyright © 2018 Tony. All rights reserved.
//

import UIKit

class MyView1: UIView {
    
    var reverse = false

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let f = self.bounds.insetBy(dx: 10, dy: 10)
        let context = UIGraphicsGetCurrentContext()
        if self.reverse {
            context?.strokeEllipse(in: f)
        } else {
            context?.stroke(f)
        }
        self.reverse = !self.reverse
    }

}

//
//  UIButton+TNTheme.swift
//  ThemeDemo
//
//  Created by Tonio on 2019/6/14.
//  Copyright © 2019 Tonio. All rights reserved.
//

import Foundation
import UIKit

private var key_bgColor: Void?

extension UIButton {
    
    var tnBackGroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key_bgColor) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &key_bgColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            backgroundColor = newValue
            let aSlector = #selector(setter: backgroundColor)
            selectorDict?["BG"] = NSStringFromSelector(aSlector)
        }
    }
    
    var btnBgColorBlock: tnBlock? {
        get {
            return objc_getAssociatedObject(self, &key_bgColor) as? tnBlock
        }
        set {
            objc_setAssociatedObject(self, &key_bgColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            let c = newValue?(TNThemeManager.shared.currentTheme!)
            backgroundColor = c
            let aSlector = #selector(setter: backgroundColor)
            self.blockDict?[NSStringFromSelector(aSlector)] = newValue
        }
    }
}

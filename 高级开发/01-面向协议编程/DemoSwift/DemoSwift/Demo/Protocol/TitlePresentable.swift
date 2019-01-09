//
//  TitlePresentable.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

import UIKit

protocol TitlePresentable {
    var title: String { get }
    var titleColor: UIColor { get }
    var titleFont: UIFont { get }
    
    func updateTitleLabel(label: UILabel)
}

extension TitlePresentable {
    var titleColor: UIColor {
        return UIColor.black
    }
    
    var titleFont: UIFont {
        return UIFont(name: "Helvetica", size: 18)!
    }
    
    func updateTitleLabel(label: UILabel) {
        label.text = title
        label.textColor = titleColor
        label.font = titleFont
    }
}

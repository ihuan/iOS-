//
//  LoadingPresenter.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

import UIKit

protocol LoadingPresenter {
    var loadingView: UIView { get set}
    func setupLoadingView()
    func setLoadingViewHidden(hidden: Bool)
    func onLoadingViewTapped()
}

// where Self: UIViewController 指定协议只能用在 UIViewContoller上
// 使用 mutating 关键字修饰的方法能在该方法中修改 struct或enum变量
extension LoadingPresenter where Self: UIViewController {
    mutating func setupLoadingView() {
        // Create loading view
    }
    
    func setLoadingViewHidden(hidden: Bool) {
        loadingView.isHidden = hidden
    }
}

//
//  NewsView.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

import UIKit

typealias NewsPresentable = TitlePresentable & ThumbnailPresentable

class NewsView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 10, y: 10, width: 150, height: 50)
        lable.font = UIFont(name: "Helvetica", size: 14)!
        lable.text = "点击屏幕，可以让我笑一笑"
        lable.textColor = UIColor.orange
        lable.textAlignment = .center
        lable.numberOfLines = 0
        lable.center.x = center.x
        return lable
    }()
    
    private lazy var headView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 70, width: 150, height: 150)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "1.png")
        imageView.center.x = center.x
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(titleLabel)
        addSubview(headView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWithPresenter(presenter: NewsPresentable) {
        presenter.updateTitleLabel(label: titleLabel)
        presenter.updateImageView(imageView: headView)
    }
    
}

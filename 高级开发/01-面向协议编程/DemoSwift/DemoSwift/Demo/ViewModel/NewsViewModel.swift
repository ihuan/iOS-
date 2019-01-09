//
//  NewsViewModel.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

import UIKit

struct NewsViewModel: NewsPresentable {
 
    var title: String
    var titleColor: UIColor
    var thumbnailUrl: String
    var thumbnailHandler: (() -> Void)?
    
    init(news: News, thumbnailHandler:@escaping (() -> Void)) {
        self.title = news.title
        if news.titleColor == "orange" {
            self.titleColor = UIColor.orange
        } else {
            self.titleColor = UIColor.black
        }
        self.thumbnailUrl = news.thumbnailUrl
        self.thumbnailHandler = thumbnailHandler
    }
}


//
//  ThumbnailPresentable.swift
//  DemoSwift
//
//  Created by LTH on 2019/1/9.
//  Copyright © 2019 i-Sprint. All rights reserved.
//

import UIKit

protocol ThumbnailPresentable {
    var thumbnailUrl: String { get }
    var thumbnailHandler: (() -> Void)? { get }
    func updateImageView(imageView: UIImageView)
}

extension ThumbnailPresentable {
    var thumbnailHandler: (() -> Void)? {
        return nil
    }
    
    func updateImageView(imageView: UIImageView) {
        // Set imageView with thumbnailUrl
        imageView.image = UIImage(named: thumbnailUrl)
        // Add tap Handler
    }

    func thumbnailImageViewTapped() {
        thumbnailHandler?()
    }
}

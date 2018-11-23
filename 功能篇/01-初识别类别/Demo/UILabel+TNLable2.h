//
//  UILabel+TNLable2.h
//  Demo
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 i-Sprint. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (TNLable2)

/*
 类别中的方法，会覆盖父类中的同名方法，无法再调用父类中的方法（因为类别中无法使用super
 为防止意外覆盖，总是应该给类别加上前缀。
 */
//- (void)setText:(NSString *)text;

- (void)tn_setText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END

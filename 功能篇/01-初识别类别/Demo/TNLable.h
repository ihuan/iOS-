//
//  TNLable.h
//  Demo
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 i-Sprint. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TNLable : UILabel

@property (nonatomic) id delegate;

@end

/*
 通过类目类实现协议
 
 这种协议缺点:
 当ViewController未实现textColorChanged方法时，会引发崩溃，
 因此在调用前，需要检查代理方法是否被实现
 */
@interface NSObject (TNLableDelegateMethods)

- (void)textColorChanged:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

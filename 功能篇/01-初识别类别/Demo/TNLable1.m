//
//  TNLable1.m
//  Demo
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 i-Sprint. All rights reserved.
//

#import "TNLable1.h"

/*
 1.扩展已有的类
 2.引用父类未公开方法
 
 请不要乱来：
 苹果官方会拒绝使用系统私有API的应用上架，
 因此即使学会了如何调用私有方法，在遇到调用其它类的私有方法时，要谨慎处理，尽量用其它方法替代。
 */
@interface TNLable(private)

/**
 该方法为父类的私有方法，通过l声明父类的类别后，可以调用
 */
- (void)giveTextRandomColor;

@end

@implementation TNLable1

- (void)setText:(NSString *)text {
    [super setText:text];
    [self giveTextRandomColor];
}

@end

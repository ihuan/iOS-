//
//  TNLable.m
//  Demo
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 i-Sprint. All rights reserved.
//

#import "TNLable.h"

@implementation TNLable

- (void)giveTextRandomColor {
    self.textColor = [UIColor orangeColor];
    if ([self.delegate respondsToSelector:@selector(textColorChanged:)]) {
        [self.delegate textColorChanged: self.textColor];
    }
}

@end

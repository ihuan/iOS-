//
//  NSString+EOCColor.m
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/27.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "NSString+EOCColor.h"

@implementation NSString (EOCColor)

- (UIColor *)stringToUIColor {
    
    //去掉空白字符
    NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //去掉#号  或者  0x
    if ([trimedString hasPrefix:@"#"]) {
        
        trimedString = [trimedString substringFromIndex:1];
        
    } else if ([trimedString hasPrefix:@"0x"]) {
        
        trimedString = [trimedString substringFromIndex:2];
        
    }
    
    //这个字符串转化为unsigned int   F0F8FF :R、G、B值单独拿出来，进行整合   0xF00000  F*16^5   0xF0  F*16
    //0xFF0000红色   0x00FF00绿色  0x0000FF蓝色
    //0xF0F8FF -> 0x0000F8   0xF0F8FF -> 0x0000FF
    NSScanner *scanner = [NSScanner scannerWithString:trimedString];
    unsigned int colorInt;
    [scanner scanHexInt:&colorInt];
    
    return [UIColor colorWithRed:(colorInt>>16)/255.f green:((colorInt&0xFF00)>>8)/255.f blue:(colorInt&0xFF)/255.f alpha:1.f];
    
}

@end

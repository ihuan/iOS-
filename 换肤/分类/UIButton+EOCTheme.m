//
//  UIButton+EOCTheme.m
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/27.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "UIButton+EOCTheme.h"
#import "NSObject+EOCTheme.h"
#import <objc/runtime.h>

@implementation UIButton (EOCTheme)

- (void)setBtnBgColorBlock:(eocBlock)btnBgColorBlock {
    
    if (btnBgColorBlock) {
        
        objc_setAssociatedObject(self, @selector(btnBgColorBlock), btnBgColorBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        //需要修改backGroundColor
        self.backgroundColor = btnBgColorBlock([EOCThemeManager sharedThemeManager].currentTheme);
        
        //我把当前的selector添加到字典里   key是当前的关键字
        [self.selectorDict setObject:NSStringFromSelector(@selector(setBackgroundColor:)) forKey:@"BG"];
        
        //我把当前的block添加到字典里，key是selector的string  value是block
//        self.blockDict[NSStringFromSelector(@selector(setBackgroundColor:))] = btnBgColorBlock;
        
    }
    
}

- (eocBlock)btnBgColorBlock {
    
    return objc_getAssociatedObject(self, @selector(btnBgColorBlock));
    
}


- (void)setEocBackGroundColor:(UIColor *)eocBackGroundColor {
    
    if (eocBackGroundColor) {
        
        objc_setAssociatedObject(self, @selector(eocBackGroundColor), eocBackGroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        //需要修改backGroundColor
        self.backgroundColor = eocBackGroundColor;
        
        //我把当前的selector添加到字典里   key是当前的关键字
        [self.selectorDict setObject:NSStringFromSelector(@selector(setBackgroundColor:)) forKey:@"BG"];

    }
    
}


- (UIColor *)eocBackGroundColor {
    
    return objc_getAssociatedObject(self, @selector(eocBackGroundColor));
    
}

@end

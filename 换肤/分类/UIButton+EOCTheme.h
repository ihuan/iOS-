//
//  UIButton+EOCTheme.h
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/27.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EOCThemeManager.h"

@interface UIButton (EOCTheme)

@property(nonatomic, strong)UIColor *eocBackGroundColor;
@property(nonatomic, strong)eocBlock btnBgColorBlock;

@end

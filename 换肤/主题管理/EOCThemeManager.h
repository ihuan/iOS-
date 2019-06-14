//
//  EOCThemeManager.h
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/26.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef UIColor *(^eocBlock)(NSString *currentTheme);
@interface EOCThemeManager : NSObject

//@#key   #:key -> "key"  @#key -> @"key"
#define blockWithKey(key) [[EOCThemeManager sharedThemeManager]getThemeColor:@#key]

+ (instancetype)sharedThemeManager;

@property(nonatomic, strong)NSDictionary *themeDict;
@property(nonatomic, strong)NSString *currentTheme;

- (UIColor *)getCurrentThemeColor:(NSString *)key;
- (eocBlock)getThemeColor:(NSString *)key;

@end

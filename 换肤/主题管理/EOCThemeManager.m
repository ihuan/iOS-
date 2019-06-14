//
//  EOCThemeManager.m
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/26.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCThemeManager.h"
#import "NSString+EOCColor.h"

@implementation EOCThemeManager

+ (instancetype)sharedThemeManager {
    
    static EOCThemeManager *themeManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        themeManager = [[EOCThemeManager alloc] init];
        
        //加载主题文件
        [themeManager loadThemeFile:@"themeColorTable.plist"];
        
        //设置当前主题
        themeManager.currentTheme = @"NORMAL";
        
    });
    return themeManager;
}

//加载主题文件
- (void)loadThemeFile:(NSString *)fileName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName.stringByDeletingPathExtension  ofType:fileName.pathExtension];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    //对dict进行处理，把16进制的颜色，转成UIColor    --->  为啥NSMutableDictionary的每一项也是NSMutableDictionary呢？
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString * key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        NSMutableDictionary *subDict = dict[key];
        [subDict enumerateKeysAndObjectsUsingBlock:^(NSString * key, id  _Nonnull obj, BOOL * _Nonnull stop) {
           
            NSString *colorString = subDict[key];
            
            //把十六进制颜色字符串  转成 UIColor颜色值
            subDict[key] = [colorString stringToUIColor];
            
        }];
        
    }];
    
    self.themeDict = dict;
    
}

- (void)setCurrentTheme:(NSString *)currentTheme {
    
    _currentTheme = currentTheme;
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"themeChanging" object:nil];
    
}

- (UIColor *)getCurrentThemeColor:(NSString *)key {
    
    NSDictionary *dict = self.themeDict[key];
    return dict[self.currentTheme];
}

- (eocBlock)getThemeColor:(NSString *)key {
    
    NSDictionary *dict = self.themeDict[key];
    
    eocBlock block = ^(NSString *currentTheme){
        
        return dict[currentTheme];
        
    };
    
    return block;
}

@end

//
//  NSObject+EOCTheme.m
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/27.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "NSObject+EOCTheme.h"
#import "EOCThemeManager.h"
#import <objc/runtime.h>
#import "NSObject+EOCDealloc.h"

@implementation NSObject (EOCTheme)

- (void)setBlockDict:(NSMutableDictionary *)blockDict {
    
    if (blockDict) {
        objc_setAssociatedObject(self, @selector(blockDict), blockDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}

- (NSMutableDictionary *)blockDict {
    
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(blockDict));
    if (!dict) {
        
        //分类持有一个对象，这个时候如果button  dealloc了，是不是这个对象也dealloc呢
        if (!self.deallocObj) {
            EOCDeallocObject *deallocObj = [[EOCDeallocObject alloc] init];
            deallocObj.deallocedBlock = ^{
              
                [[NSNotificationCenter defaultCenter] removeObserver:self];
                
            };
            self.deallocObj = deallocObj;
        }
        
        
        //添加通知的监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChanging) name:@"themeChanging" object:nil];
        
        dict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(blockDict), dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    return dict;
    
}

- (void)setSelectorDict:(NSMutableDictionary *)selectorDict {
    
    if (selectorDict) {
        objc_setAssociatedObject(self, @selector(selectorDict), selectorDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}

//self.selectorDict addObject forKey
- (NSMutableDictionary *)selectorDict {
    
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(selectorDict));
    if (!dict) {
        
        //添加通知的监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChanging) name:@"themeChanging" object:nil];
        
        dict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(selectorDict), dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    return dict;
    
}

- (void)themeChanging {
    
    //遍历字典，把btn.eocBackGroundColor = 当前主题的颜色 重新执行一遍
    [self.selectorDict enumerateKeysAndObjectsUsingBlock:^(NSString  * key, NSString  * obj, BOOL * _Nonnull stop) {
        NSLog(@"%@",self.selectorDict);

        //获取到当前主题下，该控件的颜色
        UIColor *color = [[EOCThemeManager sharedThemeManager] getCurrentThemeColor:key];

        //执行selector
        [self performSelector:NSSelectorFromString(obj) withObject:color];


    }];
    
    //遍历字典
//    [self.blockDict enumerateKeysAndObjectsUsingBlock:^(NSString  * key, eocBlock  block, BOOL * _Nonnull stop) {
//
//        //获取到当前的主题下，控件的颜色
//        UIColor *color = block([EOCThemeManager sharedThemeManager].currentTheme);
//
//        [self performSelector:NSSelectorFromString(key) withObject:color];
//
//
//
//    }];
    
    
    
}


@end

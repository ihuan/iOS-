//
//  NSObject+EOCDealloc.m
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/27.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "NSObject+EOCDealloc.h"
#import <objc/runtime.h>

@implementation NSObject (EOCDealloc)

- (void)setDeallocObj:(EOCDeallocObject *)deallocObj {
    
    objc_setAssociatedObject(self, @selector(deallocObj), deallocObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (EOCDeallocObject *)deallocObj {
    
    return objc_getAssociatedObject(self, @selector(deallocObj));
    
}

@end

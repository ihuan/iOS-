//
//  EOCDeallocObject.m
//  主题模型切换 第三期VIP
//
//  Created by 八点钟学院 on 2018/4/27.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCDeallocObject.h"

@implementation EOCDeallocObject

- (void)dealloc {
    
    if (_deallocedBlock) {
        _deallocedBlock();
    }
    
}

@end

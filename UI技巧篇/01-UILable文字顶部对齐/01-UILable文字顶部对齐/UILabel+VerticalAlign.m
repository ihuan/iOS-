//
//  UILabel+VerticalAlign.m
//  01-UILable文字顶部对齐
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 Tony. All rights reserved.
//

#import "UILabel+VerticalAlign.h"

@implementation UILabel (VerticalAlign)

- (void)alignTop {
    CGSize fontSize = [self.text sizeWithAttributes: @{NSFontAttributeName: self.font}];
    double finalWidth = self.frame.size.width;
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = self.lineBreakMode;
    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName: self.font,
                                                             NSParagraphStyleAttributeName: paragraph}
                                                   context:nil].size;
    int newLineToPad = (self.frame.size.height - theStringSize.height) / fontSize.height;
    for (int i=0; i<newLineToPad; i++) {
        self.text = [self.text stringByAppendingString:@"\n"];
    }
}

- (void)alignBottom {
    
}

@end

//
//  ViewController.m
//  01-UILable文字顶部对齐
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 Tony. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *testLb = [[UILabel alloc] init];
    NSString *testString = @"My name is Tony Li.And what a awesome day!Today what are you doing now?";
    testLb.text = testString;
    testLb.numberOfLines = 0;
    testLb.backgroundColor = [UIColor lightGrayColor];
    testLb.textAlignment = NSTextAlignmentLeft;
    UIFont *font = [UIFont boldSystemFontOfSize:14.0];
    testLb.font = font;
    NSDictionary *attrs = @{NSFontAttributeName: font};
    // 宽度固定，高度随字体
    CGSize maximumSize = CGSizeMake(300, MAXFLOAT);
    CGRect testSize = [testString boundingRectWithSize:maximumSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    CGRect testFrame = CGRectMake(10, 64 + 10, 300, testSize.size.height);
    testLb.frame = testFrame;
    [self.view addSubview:testLb];
    
}


@end

//
//  ViewController.m
//  01-UILable文字顶部对齐
//
//  Created by LTH on 2018/11/23.
//  Copyright © 2018 Tony. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+VerticalAlign.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark - 计算高度处理
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
    CGRect testSize = [testString boundingRectWithSize:maximumSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attrs
                                               context:nil];
    CGRect testFrame = CGRectMake(10, 64 + 10, 300, testSize.size.height);
    testLb.frame = testFrame;
    [self.view addSubview:testLb];
    
#pragma mark - 采用“\n”处理
    UILabel *testLb1 = [[UILabel alloc] init];
    testLb1.frame = CGRectMake(10, 64 + 50, 300, 100);
    NSString *testString1 = @"My name is Tony Li.And what a awesome day!Today what are you doing now?\n\n\n\n\n\n";
    testLb1.numberOfLines = 0;
    testLb1.text = testString1;
    //testLb1.numberOfLines = 0;
    testLb1.backgroundColor = [UIColor lightGrayColor];
    testLb1.textAlignment = NSTextAlignmentLeft;
    testLb1.font = font;
    [self.view addSubview:testLb1];
    
#pragma mark - category处理
    UILabel *testLb2 = [[UILabel alloc] init];
    testLb2.frame = CGRectMake(10, 64 + 10 + 150, 300, 100);
    NSString *testString2 = @"My name is Tony Li.And what a awesome day!Today what are you doing now?My name is Tony Li.And what a awesome day!Today what are you doing now?";
    testLb2.numberOfLines = 0;
    testLb2.lineBreakMode = NSLineBreakByWordWrapping;
    testLb2.text = testString2;
    testLb2.backgroundColor = [UIColor lightGrayColor];
    testLb2.textAlignment = NSTextAlignmentLeft;
    testLb2.font = font;
    [testLb2 alignTop];
    [self.view addSubview:testLb2];
    
    
}


@end

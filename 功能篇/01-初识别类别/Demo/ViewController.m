//
//  ViewController.m
//  Demo
//
//  Created by LTH on 07/08/2018.
//  Copyright © 2018 i-Sprint. All rights reserved.
//

#import "ViewController.h"
#import "TNLable1.h"

@interface ViewController ()

@property (nonatomic, strong) TNLable1 *lable;
@property (nonatomic, strong) UIColor *currentColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _lable = [[TNLable1 alloc] initWithFrame:CGRectMake(10, 64 + 10, 300, 30)];
    _lable.center = self.view.center;
    _lable.text = @"类目";
    _lable.textAlignment = NSTextAlignmentCenter;
    _lable.delegate = self;
    [self.view addSubview:_lable];
    _currentColor = _lable.textColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([_lable.text isEqualToString:@"类目"]) {
        [_lable setText:@"Category"];
    } else {
        [_lable setText:@"类目"];
    }
 
}

#pragma mark - 文字内容被改变的代理
- (void)textColorChanged:(UIColor *)color {
    if (_currentColor == [UIColor orangeColor]) {
        _currentColor = [UIColor redColor];
    } else {
        _currentColor = [UIColor orangeColor];
    }
    _lable.textColor = _currentColor;
}

@end

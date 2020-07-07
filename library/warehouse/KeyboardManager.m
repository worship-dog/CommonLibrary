//
//  KeyboardManager.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "KeyboardManager.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface KeyboardManager ()

@end

@implementation KeyboardManager

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *first = [[UITextField alloc]initWithFrame:CGRectMake(20, 460, self.view.bounds.size.width-40, 30)];
    UITextField *second = [[UITextField alloc]initWithFrame:CGRectMake(20, 500, self.view.bounds.size.width-40, 30)];
    UITextField *third = [[UITextField alloc]initWithFrame:CGRectMake(20, 540, self.view.bounds.size.width-40, 30)];
    UITextField *forth = [[UITextField alloc]initWithFrame:CGRectMake(20, 580, self.view.bounds.size.width-40, 30)];
    UITextField *five = [[UITextField alloc]initWithFrame:CGRectMake(20, 620, self.view.bounds.size.width-40, 30)];
    UITextField *six = [[UITextField alloc]initWithFrame:CGRectMake(20, 660, self.view.bounds.size.width-40, 30)];
    UITextField *seven = [[UITextField alloc]initWithFrame:CGRectMake(20, 700, self.view.bounds.size.width-40, 30)];
    UITextField *eight = [[UITextField alloc]initWithFrame:CGRectMake(20, 740, self.view.bounds.size.width-40, 30)];
    
    first.layer.borderWidth = 0.5;
    second.layer.borderWidth = 0.5;
    third.layer.borderWidth = 0.5;
    forth.layer.borderWidth = 0.5;
    five.layer.borderWidth = 0.5;
    six.layer.borderWidth = 0.5;
    seven.layer.borderWidth = 0.5;
    eight.layer.borderWidth = 0.5;
    
    [self.view addSubview:first];
    [self.view addSubview:second];
    [self.view addSubview:third];
    [self.view addSubview:forth];
    [self.view addSubview:five];
    [self.view addSubview:six];
    [self.view addSubview:seven];
    [self.view addSubview:eight];
    
    //点击界面收起键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    //隐藏键盘上的工具条(向上、向下、done)
    //[IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    //某一个输入框不需要工具条时
    eight.inputAccessoryView = [[UIView alloc]init];
    
}


@end

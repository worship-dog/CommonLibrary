//
//  MasonryViewController.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "MasonryViewController.h"
#import <Masonry.h>

static CGFloat padding = 10;

@interface MasonryViewController ()

@property (strong, nonatomic) UIButton *btn1;
@property (strong, nonatomic) UIButton *btn2;
@property (strong, nonatomic) UIButton *btn3;
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *yellowView;
@property (strong, nonatomic) UIView *blueView;

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
            下面的例子是通过给equalTo()方法传入一个数组，设置数组中子视图及当前make对应的视图之间等高。
            
            需要注意的是，下面block中设置边距的时候，应该用insets来设置，而不是用offset。
            因为用offset设置right和bottom的边距时，这两个值应该是负数，所以如果通过offset来统一设置值会有问题。
            */
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _redView = [[UIView alloc]init];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
        
    _blueView = [[UIView alloc]init];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    _yellowView = [[UIView alloc]init];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    _btn1 = [[UIButton alloc]init];
    _btn1.frame = CGRectMake(100, 150, self.view.bounds.size.width-200, 40);
    _btn1.backgroundColor = [UIColor redColor];
    [_btn1 setTitle:@"等高" forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(viewHeight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn1];
    
    _btn2 = [[UIButton alloc]init];
    _btn2.frame = CGRectMake(100, 200, self.view.bounds.size.width-200, 40);
    _btn2.backgroundColor = [UIColor redColor];
    [_btn2 setTitle:@"等宽" forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(viewWidth) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
    
    _btn3 = [[UIButton alloc]init];
    _btn3.frame = CGRectMake(100, 250, self.view.bounds.size.width-200, 40);
    _btn3.backgroundColor = [UIColor redColor];
    [_btn3 setTitle:@"垂直居中" forState:UIControlStateNormal];
    [_btn3 addTarget:self action:@selector(viewCenter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn3];
}

- (void)viewHeight{
    
    /**********  等高   ***********/
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
        make.bottom.equalTo(_blueView.mas_top).offset(-padding);
    }];
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, 0, padding));
        make.bottom.equalTo(_yellowView.mas_top).offset(-padding);
    }];
    /**
    下面设置make.height的数组是关键，通过这个数组可以设置这三个视图高度相等。其他例如宽度之类的，也是类似的方式。
    */
    [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, padding, padding));
        make.height.equalTo(@[_blueView,_redView]);
    }];
}

- (void)viewWidth{
    /**********  等宽   ***********/
       [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.top.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, padding, 0));
           make.right.equalTo(_blueView.mas_left).offset(-padding);
       }];
       [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(padding, 0, padding, 0));
           make.right.equalTo(_yellowView.mas_left).offset(-padding);
       }];
       [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(padding, 0, padding, padding));
           make.width.equalTo(@[_redView,_blueView]).offset(-padding);
       }];
}

- (void)viewCenter{
    /********  垂直居中  ********/
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view).mas_offset(padding);
        make.right.equalTo(_blueView.mas_left).mas_offset(-padding);
        make.height.mas_equalTo(150);
    }];
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.equalTo(_yellowView.mas_left).mas_offset(-padding);
        make.width.equalTo(_redView);
        make.height.mas_equalTo(150);
    }];
    [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.equalTo(self.view).mas_offset(-padding);
        make.width.equalTo(@[_redView,_blueView]);
        make.height.mas_equalTo(150);
    }];
}

@end

//
//  ViewController.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "ViewController.h"
#import "MasonryViewController.h"
#import "KeyboardManager.h"
#import "NetWork.h"
#import "Refresh.h"
#import "CycleScroll.h"
#import "ImagePickerController.h"
#import "ModelTableView.h"

@interface ViewController ()

@property (strong, nonatomic) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *masonry = [[UIButton alloc]init];
    masonry.frame = CGRectMake(5, 100, self.view.bounds.size.width-10, 30);
    masonry.backgroundColor = [UIColor grayColor];
    masonry.layer.cornerRadius = 10;
    [masonry setTitle:@"Masonry" forState:UIControlStateNormal];
    [masonry addTarget:self action:@selector(jumpToMasonry) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *json = [[UIButton alloc]init];
    json.frame = CGRectMake(5, 150, self.view.bounds.size.width-10, 30);
    json.backgroundColor = [UIColor grayColor];
    json.layer.cornerRadius = 10;
    [json setTitle:@"JsonModel" forState:UIControlStateNormal];
    [json addTarget:self action:@selector(lookJson) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *keyboard = [[UIButton alloc]init];
    keyboard.frame = CGRectMake(5, 200, self.view.bounds.size.width-10, 30);
    keyboard.backgroundColor = [UIColor grayColor];
    keyboard.layer.cornerRadius = 10;
    [keyboard setTitle:@"IQKeyboardManager" forState:UIControlStateNormal];
    [keyboard addTarget:self action:@selector(lookKeyboard) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *netWork = [[UIButton alloc]init];
    netWork.frame = CGRectMake(5, 250, self.view.bounds.size.width-10, 30);
    netWork.backgroundColor = [UIColor grayColor];
    netWork.layer.cornerRadius = 10;
    [netWork setTitle:@"AFNetWorking" forState:UIControlStateNormal];
    [netWork addTarget:self action:@selector(lookNetWork) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *refresh = [[UIButton alloc]init];
    refresh.frame = CGRectMake(5, 300, self.view.bounds.size.width-10, 30);
    refresh.backgroundColor = [UIColor grayColor];
    refresh.layer.cornerRadius = 10;
    [refresh setTitle:@"MJRefresh" forState:UIControlStateNormal];
    [refresh addTarget:self action:@selector(lookRefresh) forControlEvents:UIControlEventTouchUpInside];
       
    UIButton *cycleScroll =  [[UIButton alloc]init];
    cycleScroll.frame = CGRectMake(5, 350, self.view.bounds.size.width-10, 30);
    cycleScroll.backgroundColor = [UIColor grayColor];
    cycleScroll.layer.cornerRadius = 10;
    [cycleScroll setTitle:@"SDCycleScrollView" forState:UIControlStateNormal];
    [cycleScroll addTarget:self action:@selector(lookCycleScroll) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *imagePicker =  [[UIButton alloc]init];
    imagePicker.frame = CGRectMake(5, 400, self.view.bounds.size.width-10, 30);
    imagePicker.backgroundColor = [UIColor grayColor];
    imagePicker.layer.cornerRadius = 10;
    [imagePicker setTitle:@"ImagePickerController" forState:UIControlStateNormal];
    [imagePicker addTarget:self action:@selector(lookImagePicker) forControlEvents:UIControlEventTouchUpInside];
    
    _textView = [[UITextView alloc]init];
    _textView.frame = CGRectMake(5, 450, self.view.bounds.size.width-10, 350);
    _textView.layer.cornerRadius = 10;
    _textView.layer.borderWidth = 0.5;
    
    [self.view addSubview:masonry];
    [self.view addSubview:json];
    [self.view addSubview:keyboard];
    [self.view addSubview:netWork];
    [self.view addSubview:refresh];
    [self.view addSubview:cycleScroll];
    [self.view addSubview:imagePicker];
    [self.view addSubview:self.textView];
}

- (void)jumpToMasonry{
    
    MasonryViewController *mvc = [[MasonryViewController alloc]init];
    [self.navigationController pushViewController:mvc animated:YES];
}

- (void)lookJson{
    ModelTableView *tableView = [[ModelTableView alloc]init];
    [self.navigationController pushViewController:tableView animated:YES];
}

- (void)lookKeyboard{
    
    KeyboardManager *manager = [[KeyboardManager alloc]init];
    [self.navigationController pushViewController:manager animated:YES];
}

- (void)lookNetWork{
    
    //获取通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //添加观察者  Observer表示观察者 changeText:表示接受到的消息
    //name表示在通知中心注册的通知名 object表示可以响应的对象 为nil时表示可响应所有对象
    [center addObserver:self selector:@selector(changeText:) name:@"response" object:nil];
    
    NetWork *netWork = [[NetWork alloc]init];
    
    NSString *urlString = @"http://calendar.api51.cn/v4/?date=20190618&type=economics";
    NSDictionary *header = [NSDictionary dictionaryWithObjectsAndKeys:@"APPCODE 5b1785abb55f45d1b181b89918811d74",@"Authorization", nil];

    [netWork reach];
    [netWork getRequestWithUrl:urlString WithHeader:header];
    
}

- (void)lookRefresh{
    
    Refresh *refresh = [[Refresh alloc]init];
    [self.navigationController pushViewController:refresh animated:YES];
    
}

- (void)lookCycleScroll{
    CycleScroll *cycleScroll = [[CycleScroll alloc]init];
    [self.navigationController pushViewController:cycleScroll animated:YES];
}

- (void)lookImagePicker{
    ImagePickerController *imagePicker = [[ImagePickerController alloc]init];
    [self.navigationController pushViewController:imagePicker animated:YES];
}

- (void)changeText:(NSNotification *)notification{
    
    NSDictionary *userInfo = notification.userInfo;
    self.textView.text = [userInfo objectForKey:@"response"];
    self.textView.font = [UIFont systemFontOfSize:18];
}

//移除监听
- (void)dealloc{
    //移除指定
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"PassValue" object:nil];
    //移除所有
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

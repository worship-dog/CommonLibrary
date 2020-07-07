//
//  Refresh.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "Refresh.h"
#import <MJRefresh/MJRefresh.h>

@interface Refresh ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation Refresh

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
//    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
   
    
    //手动进入刷新状态
    //[tableView.mj_header beginRefreshing];
    //手动结束刷新状态
    //[tableView.mj_header endRefreshing];
    
    //根据拖拽比例切换透明度
    _tableView.mj_header.automaticallyChangeAlpha = YES;

    
        //有动画图片时
//           MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
//           //普通状态下的图片
//           NSMutableArray *idleImages = [NSMutableArray array];
//           for (int i = 0; i < 44; i++)
//           {
//               UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%d", i+1]];
//               NSLog(@"%@", [NSString stringWithFormat:@"dropdown_anim__000%02d", i+1]);
//               if (img) {
//                   [idleImages addObject:img];
//
//               }
//           }
//           [header setImages:idleImages forState:MJRefreshStateIdle];
//
//           NSMutableArray *pullingImages = [NSMutableArray array];
//              for (int i = 45; i < 60; i++)
//              {
//                  UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%d", i+1]];
//                  NSLog(@"%@", [NSString stringWithFormat:@"dropdown_anim__000%d", i+1]);
//                  if (img) {
//                      [pullingImages addObject:img];
//                  }
//
//              }
//           [header setImages:pullingImages forState:MJRefreshStatePulling];
//
//           //刷新d中的动画图片
//           NSMutableArray *refreshingImages = [NSMutableArray array];
//           for (int i = 0; i < 2; i++)
//           {
//               UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%i", i + 1]];
//               if (img) {
//                   [refreshingImages addObject:img];
//               }
//           }
//           [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
//
//           _tableView.mj_header = header;
    
    
    //控制是否显示时间状态等
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
    //是否隐藏时间
    header.lastUpdatedTimeLabel.hidden = NO;
    //文字颜色
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    header.stateLabel.textColor = [UIColor redColor];
    //普通状态的文字
    [header setTitle:@"往下拉" forState:MJRefreshStateIdle];
    //松开可以刷新
    [header setTitle:@"你倒是松开啊" forState:MJRefreshStatePulling];
    //正在刷新
    [header setTitle:@"你着什么急啊" forState:MJRefreshStateRefreshing];
    //是否隐藏状态
    header.stateLabel.hidden = NO;
    
    _tableView.mj_header = header;
    
    [self.view addSubview:self.tableView];
    
    //使用block
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"开始刷新");
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(action) userInfo:nil repeats:NO];
    }];

    
    /*****上拉加载***/
    
    
}

#pragma mark -selector
- (void)headerAction{
    
}

- (void)action{
    [self.tableView.mj_header endRefreshing];
    NSLog(@"结束");
}


#pragma mark -协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row+1];
    return cell;
}

@end

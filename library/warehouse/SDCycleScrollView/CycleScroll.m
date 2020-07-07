//
//  CycleScroll.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "CycleScroll.h"
#import <SDCycleScrollView.h>

@interface CycleScroll ()<SDCycleScrollViewDelegate>

@property(strong,nonatomic)NSArray *localImages;
@property(strong,nonatomic)SDCycleScrollView *cycleView;

@end

@implementation CycleScroll

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self scrollLocalImages];
    
}

- (void)scrollLocalImages{
    
    /*
     测试本地图片数据
     */
    CGRect rect = CGRectMake(0, 150, self.view.bounds.size.width, 300);
    self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:rect imageNamesGroup:self.localImages];
    
    //设置图片视图显示类型
    self.cycleView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    //设置轮播视图的分页控件是否显示
    self.cycleView.showPageControl = YES;
    //设置分页控件的位置
    self.cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //当前分页控件颜色
    self.cycleView.currentPageDotColor = [UIColor whiteColor];
    //其他分页控件颜色
    self.cycleView.pageDotColor = [UIColor grayColor];
    
    [self.view addSubview:self.cycleView];
    
}

#pragma mark-代理方法
/**点击图片回调*/
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

/**图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

#pragma mark-懒加载
- (NSArray *)localImages{
    if (!_localImages) {
        _localImages = @[@"德国.jpg",@"加拿大.jpg",@"美国.jpg",@"日本.jpg",@"西班牙.jpg"];
    }
    return _localImages;
}



@end

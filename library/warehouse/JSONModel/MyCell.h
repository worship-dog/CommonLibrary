//
//  MyCell.h
//  library
//
//  Created by 账户 on 2020/7/7.
//  Copyright © 2020 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlaceListModel;
NS_ASSUME_NONNULL_BEGIN

@interface MyCell : UITableViewCell

@property (nonatomic, strong) PlaceListModel *model;
@property (nonatomic, strong) UILabel * timeLable;
@property (nonatomic, strong) UILabel * contentLable;
@property (nonatomic, strong) UILabel * countyLable;
@property (nonatomic, strong) UILabel * underLable;
@property (nonatomic, strong) UIImageView * timeImage;
@property (nonatomic, strong) UIImageView * starImage;
@property (nonatomic, strong) UIImageView * countyImage;

@end

NS_ASSUME_NONNULL_END

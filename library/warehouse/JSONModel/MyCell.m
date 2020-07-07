//
//  MyCell.m
//  library
//
//  Created by 账户 on 2020/7/7.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "MyCell.h"
#import "PlaceListModel.h"

@implementation MyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    
    if (self) {
        self.timeLable = [[UILabel alloc] init] ;
        _timeLable.frame =CGRectMake(120, 36, 40, 15) ;
        _timeLable.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview: _timeLable];
        
        self.countyLable = [[UILabel alloc]init];
        _countyLable.frame = CGRectMake(79, 70, 200, 42);
        [self.contentView addSubview: _countyLable];
        
        self.contentLable = [[UILabel alloc] init] ;
        _contentLable.frame = CGRectMake(170, 76, 300, 30) ;
         _contentLable.numberOfLines = 0;
        [self.contentView addSubview: _contentLable] ;
        
        self.underLable = [[UILabel alloc]init];
        _underLable.frame = CGRectMake(98, 100, 300, 100);
        _underLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:_underLable];
        
        self.timeImage = [[UIImageView alloc]init];
        _timeImage.frame = CGRectMake(90, 35, 15, 15);
        [self.contentView addSubview:_timeImage];
        
        self.starImage = [[UIImageView alloc]init];
        _starImage.frame = CGRectMake(165, 35, 100, 17);
        [self.contentView addSubview:_starImage];
        
        self.countyImage = [[UIImageView alloc]init];
        _countyImage.frame = CGRectMake(10, 15, 70, 50);
        [self.contentView addSubview:_countyImage];

    }
    
    return  self;
}

- (void)setModel:(PlaceListModel *)model {
    _model = model;
    NSString *pub_time = [[model.pub_time substringFromIndex:11]substringToIndex:5];
    NSString *actual = [@"前值:" stringByAppendingString:model.actual  ];
    NSString *previous = [@"  预期:" stringByAppendingString:model.previous];
    if ([model.consensus isEqual:[NSNull null]] || model.consensus == nil){
        model.consensus = @"未公布";
    }
    NSString *consensus = [@"  公布:" stringByAppendingString:model.consensus];
    self.underLable.text = [[actual stringByAppendingString:previous]stringByAppendingString:consensus];
    self.timeLable.text = pub_time;
    self.countyLable.text =[NSString stringWithFormat:@"【%@】",model.country];
    self.contentLable.text = model.name;
    self.countyImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", model.country]];
    self.timeImage.image = [UIImage imageNamed: @"时间"];
    self.starImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", model.star]];
}

@end

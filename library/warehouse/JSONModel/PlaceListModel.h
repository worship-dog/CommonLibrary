//
//  PlaceListModel.h
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface PlaceListModel : JSONModel

@property(nonatomic,copy)NSString <Optional> *id;
@property(nonatomic,copy)NSString <Optional> *unit;
@property(nonatomic,copy)NSString <Optional> *pub_time;
@property(nonatomic,copy)NSString <Optional> *indicator_id;
@property(nonatomic,copy)NSString <Optional> *time_period;
@property(nonatomic,copy)NSString <Optional> *affect;
@property(nonatomic,copy)NSString <Optional> *actual;
@property(nonatomic,copy)NSString <Optional> *star;
@property(nonatomic,copy)NSString <Optional> *previous;
@property(nonatomic,copy)NSString <Optional> *consensus;
@property(nonatomic,copy)NSString <Optional> *country;
@property(nonatomic,copy)NSString <Optional> *name;
@property(nonatomic,copy)NSString <Optional> *revised;

@end



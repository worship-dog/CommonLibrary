//
//  NetWork.h
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetWork : UIViewController

- (void)reach;

- (void)getRequestWithUrl:(NSString *)urlString WithHeader:(NSDictionary *)dictionary;



@end

NS_ASSUME_NONNULL_END

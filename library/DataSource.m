//
//  DataSource.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+ (NSData *)postJSON{
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"追风少年",@"name",
                         @"123",@"id" , nil];
    
    NSArray *array = [NSArray arrayWithObject:dic];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    
   return data;
}

@end

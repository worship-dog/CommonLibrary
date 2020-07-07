//
//  NetWork.m
//  library
//
//  Created by 账户 on 2020/7/6.
//  Copyright © 2020 itcast. All rights reserved.
//

#import "NetWork.h"
#import <AFNetworking/AFNetworking.h>

@interface NetWork ()

@end

@implementation NetWork

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//检测网络状态
- (void)reach{
    /*
       AFNetworkReachabilityStatusUnknown          = -1,   未知
       AFNetworkReachabilityStatusNotReachable     = 0,    未连接
       AFNetworkReachabilityStatusReachableViaWWAN = 1,    3G 花钱
       AFNetworkReachabilityStatusReachableViaWiFi = 2,    WIFI
    */
    
    //如果要检测网络状态的变化，必须用检测管理器的单例
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"status = %ld",status);
    }];
    
}


//get方法
- (void)getRequestWithUrl:(NSString *)urlString WithHeader:(NSDictionary *)dictionary{
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url.absoluteString parameters:nil headers:dictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        //NSLog(@"%@",responseObject);
        //转为json 重新编码输出（方便查看）
        NSArray *arr = responseObject;
        NSData *data = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"%@",str);
        
        NSNotification *notice = [NSNotification notificationWithName:@"response" object:nil userInfo:@{@"response":str}];
        [[NSNotificationCenter defaultCenter]postNotification:notice];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误 = %@",error);
    }];
}

//post方法(上传纯文本)
-(void)postWeiboWithUrl:(NSString *)urlString WithParameters:(NSDictionary *)dictionary
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //返回格式
    //这里得到的是 JSon 数据，默认的 responseSeroalizer 也是 JSon 数据
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //得到的是 NSData 数据
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //接受一些类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSURL *url = [NSURL URLWithString:urlString];
    [manager POST:url.absoluteString parameters:dictionary headers:nil constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"响应");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误");
    }];

}

//上传图片及文本
-(void)postWeiboWithUrl:(NSString *)urlString WithParameters:(NSDictionary *)dictionary WithImageName:(NSString *)imageName
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSURL *url = [NSURL URLWithString:urlString];
    [manager POST:url.absoluteString parameters:dictionary headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData){
         NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"voiceChange"]);
        //      NSData *data1 = UIImageJPEGRepresentation([UIImage imageNamed:@"voiceChange"], 0.5);
        [formData appendPartWithFileData:data name:@"pic" fileName:@"测试.png" mimeType:@"png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传 = %@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"响应 = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误 = %@",error);
    }];
   
}



@end

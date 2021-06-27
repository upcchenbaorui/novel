//
//  RDNetWorkManager.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/19.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDNetWorkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "RDUserMsgManager.h"
@implementation RDNetWorkManager



+ (void)userLogin:(NSString *)userId pwd:(NSString *)pwd completion:(void (^)(id _Nonnull, NSError * _Nullable))completion {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
       @"username":userId,
       @"pwd":pwd
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/login"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
       //进度
       //进度
        NSLog(@"123");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // task 我们可以通过task拿到响应头
        if(completion) {
            completion(responseObject,nil);
        }
       // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
        NSLog(@"123");
    }];
    
}

@end

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
#import "RegisterModel.h"


#define kRDBookListUpdated @"kRDBookListUpdated"
#define kRDLikeUpdated @"kRDLikeUpdated"
#define KRDDeleteBook @"KRDDeleteBook"

@implementation RDNetWorkManager


+ (void)userUnLogin {
  
}

+ (void)userLikeBook:(void (^)(id _Nonnull, NSError * _Nullable))completion {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 1.f;
    NSDictionary *dict = @{
       @"userId" : [RDUserMsgManager userId],
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/recommend/get"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        NetworkModel *model = [[NetworkModel alloc] initWithData:data error:nil];
        if(completion) {
            NSDictionary *dic = @{
                @"category" : @(model.data.category),
            };
            [[NSNotificationCenter defaultCenter] postNotificationName:kRDLikeUpdated object:nil userInfo:dic];
            completion(model,nil);
        }
       // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
    }];
}

+ (void)userLookBook:(NSString *)category {
    NSDictionary *dic = @{
        @"玄幻小说" : @(1),
        @"修真小说" : @(2),
        @"都市小说" : @(3),
        @"网游小说" : @(4),
        @"科幻灵异" : @(5),
        @"历史小说" : @(6),
        @"言情小说" : @(7),
        @"其他小说" : @(8),
        @"女生小说" : @(9),
    };
    NSInteger num = 0;
    for(NSString *name in dic.allKeys) {
        if([name isEqualToString:category]) {
            NSNumber *n = [dic objectForKey:name];
            num = n.integerValue;
        }
    }
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 2.f;
    NSDictionary *dict = @{
       @"userId" : [RDUserMsgManager userId],
       @"category" : @(num),
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/recommend/update"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
    }];
}

+ (void)userDeleteBooks:(NSInteger )bookId {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 2.f;
    NSDictionary *dict = @{
       @"userId" : [RDUserMsgManager userId],
       @"bookId" : @(bookId),
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/book/delete"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        NetworkModel *model = [[NetworkModel alloc] initWithData:data error:nil];
        if(model) {
            if(model.data.code == 0) {
                [RDNetWorkManager reloadBooks];
            }
            NSDictionary *dic = @{
                @"code" : @(model.data.code)
            };
            [[NSNotificationCenter defaultCenter] postNotificationName:KRDDeleteBook object:nil userInfo:dic];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
        NSDictionary *dic = @{
            @"code" : @(-1)
        };
        [[NSNotificationCenter defaultCenter] postNotificationName:KRDDeleteBook object:nil userInfo:dic];
    }];
}

+ (void)reloadBooks {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 2.f;
    NSDictionary *dict = @{
       @"userId" : [RDUserMsgManager userId],
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/book/get"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        NetworkModel *model = [[NetworkModel alloc] initWithData:data error:nil];
        NSDictionary *dic = @{
            @"bookInfo" : model.data.bookInfoList
        };
        [[NSNotificationCenter defaultCenter] postNotificationName:kRDBookListUpdated object:nil userInfo:dic];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
    }];
}

+ (void)userAddBook:(BookInfoModel *)bookInfo completion:(void (^ _Nullable)(id _Nonnull, NSError * _Nullable))completion {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 1.f;
    NSDictionary *dict = @{
       @"userId" : [RDUserMsgManager userId],
       @"bookId" : @(bookInfo.bookId),
       @"bookName" : bookInfo.bookName,
       @"imageUrl" : bookInfo.imageUrl
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/book/add"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        NetworkModel *model = [[NetworkModel alloc] initWithData:data error:nil];
        if(completion) {
            completion(model,nil);
        }
       // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
    }];

}

+ (void)userLogin:(NSString *)userId pwd:(NSString *)pwd completion:(void (^)(id _Nonnull, NSError * _Nullable))completion {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 2.f;
    NSDictionary *dict = @{
       @"userId":userId,
       @"pwd":pwd
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/login"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        NetworkModel *model = [[NetworkModel alloc] initWithData:data error:nil];
        if(completion) {
            completion(model,nil);
        }
       // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
    }];
}

+ (void)userRegister:(NSString *)userId pwd:(NSString *)pwd completion:(void (^)(id _Nullable model, NSError * _Nullable))completion {
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 1.f;
    NSDictionary *dict = @{
       @"userId":userId,
       @"pwd":pwd
    };
    // parameters 参数字典
    NSMutableString *ip = [[NSMutableString alloc] init];
    [ip appendString:@"http://"];
    [ip appendString:[RDUserMsgManager ip]];
    
    [ip appendString:@":6789/register"];
    [manager GET:ip parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // task 我们可以通过task拿到响应头
        NetworkModel *model = [[NetworkModel alloc] initWithData:responseObject error:nil];
        if(completion) {
            completion(model,nil);
        }
       // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       // error 错误信息
//        NSLog(@"123");
        if(completion) {
            completion(nil,error);
        }
    }];

}

@end

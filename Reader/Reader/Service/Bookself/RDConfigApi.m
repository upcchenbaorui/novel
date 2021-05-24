//
//  RDConfigApi.m
//  Reader
//
//  Created by 陈保瑞 on 2020/3/6.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDConfigApi.h"
#import "RDConfigModel.h"

@implementation RDConfigApi
- (NSString *)requestUrl {
    return @"/app/open/api/system/getAppConfig";
}
-(RDConfigModel *)configModel
{
    NSArray *arr =  [[RDModelAgent agent] createModel:RDConfigModel.class fromJson:self.httpModel.data];
    return [arr objectAtIndexSafely:0];
}

- (id)requestArgument {
    NSDictionary *dic = @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
    };
    return dic;
}

@end

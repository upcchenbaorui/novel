//
//  RDAllCategoryApi.m
//  Reader
//
//  Created by yuenov on 2020/2/25.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDAllCategoryApi.h"

@implementation RDAllCategoryApi
- (NSString *)requestUrl {
    return @"/app/open/api/category/getCategoryChannel";
}

-(NSArray <RDChannelModel *>*)channel
{
    return [[RDModelAgent agent] createModel:RDChannelModel.class fromJson:self.httpModel.data[@"channels"]];
}

- (id)requestArgument {
    NSDictionary *dic = @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
    };
    return dic;
}
@end

//
//  RDOtherCategoryApi.m
//  Reader
//
//  Created by 陈保瑞 on 2020/2/26.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDEndApi.h"

@implementation RDEndApi
- (instancetype)init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 20;
    }
    
    return self;
}
- (NSString *)requestUrl {
    return @"/app/open/api/category/getCategoryEnd";
}
- (id)requestArgument {
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"pageNum": @(self.page),
        @"pageSize": @(self.size)
             };
}
-(NSArray <RDDiscoverItemModel *>*)list
{
    return [[RDModelAgent agent] createModel:RDDiscoverItemModel.class fromJson:self.httpModel.data[@"list"]];
}
@end

//
//  RDRankContentApi.m
//  Reader
//
//  Created by 陈保瑞 on 2020/2/27.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDRankContentApi.h"

@implementation RDRankContentApi
- (instancetype)init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 20;
    }
    
    return self;
}
- (NSString *)requestUrl {
    return @"/app/open/api/rank/getPage";
}
- (id)requestArgument {
    return @{
            @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
             @"pageNum": @(self.page),
             @"pageSize": @(self.size),
             @"rankId":@(self.rankId),
             @"channelId":@(self.channelId)
             };
}
-(NSArray <RDLibraryDetailModel *>*)list
{
    return [[RDModelAgent agent] createModel:RDLibraryDetailModel.class fromJson:self.httpModel.data[@"list"]];
}
@end

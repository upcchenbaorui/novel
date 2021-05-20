//
//  RDDiscoverAllApi.m
//  Reader
//
//  Created by yuenov on 2020/3/10.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDDiscoverAllApi.h"

@implementation RDDiscoverAllApi

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 10;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/app/open/api/category/discoveryAll";
}

-(id)requestArgument
{
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"pageNum":@(self.page),
        @"pageSize":@(self.size),
        @"categoryId":@(self.categoryId),
        @"type":MakeNSStringNoNull(self.type)
    };
}

-(NSArray <RDLibraryDetailModel *>*)list
{
    return [[RDModelAgent agent] createModel:RDLibraryDetailModel.class fromJson:self.httpModel.data[@"list"]];
}


@end

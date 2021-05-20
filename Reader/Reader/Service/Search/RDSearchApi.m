//
//  RDSearchApi.m
//  Reader
//
//  Created by yuenov on 2020/3/2.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDSearchApi.h"

@implementation RDSearchApi
- (instancetype)init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 20;
    }
    
    return self;
}
- (NSString *)requestUrl {
    return @"/app/open/api/book/search";
}
-(id)requestArgument
{
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"pageNum":@(self.page),
        @"pageSize":@(self.size),
        @"keyWord":MakeNSStringNoNull(self.word)
    };
}
-(NSArray <RDBookDetailModel *>*)list
{
    return [[RDModelAgent agent] createModel:RDBookDetailModel.class fromJson:self.httpModel.data[@"list"]];
}
@end

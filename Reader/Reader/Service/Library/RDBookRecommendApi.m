//
//  RDBookRecommendApi.m
//  Reader
//
//  Created by 陈保瑞 on 2020/3/11.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBookRecommendApi.h"
#import "RDLibraryDetailModel.h"

@implementation RDBookRecommendApi
- (instancetype)init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 20;
    }
    
    return self;
}
- (id)requestArgument {
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"pageNum": @(self.page),
        @"pageSize": @(self.size),
        @"bookId":@(self.bookId)
    };
}
- (NSString *)requestUrl {
    return @"/app/open/api/book/getRecommend";
}
-(NSArray <RDLibraryDetailModel *>*)list
{
    return [[RDModelAgent agent] createModel:RDLibraryDetailModel.class fromJson:self.httpModel.data[@"list"]];
}
@end

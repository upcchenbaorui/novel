//
//  RDSpecialApi.m
//  Reader
//
//  Created by yuenov on 2020/4/1.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDSpecialApi.h"

@implementation RDSpecialApi
- (instancetype)init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 20;
    }
    
    return self;
}
- (NSString *)requestUrl {
    return @"/app/open/api/book/getSpecialList";
}
- (id)requestArgument {
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"pageNum": @(self.page),
        @"pageSize": @(self.size)
             };
}
-(NSArray <RDSpecialModel *>*)list
{
    return [[RDModelAgent agent] createModel:RDSpecialModel.class fromJson:self.httpModel.data[@"specialList"]];
}
@end

//
//  RDReadDetailApi.m
//  Reader
//
//  Created by yuenov on 2019/12/23.
//  Copyright © 2019 yuenov. All rights reserved.
//

#import "RDReadDetailApi.h"

@implementation RDReadDetailApi
- (NSString *)requestUrl {
    return @"/app/open/api/book/getDetail";
}

-(id)requestArgument
{
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"bookId":@(self.bookId)
    };
}

-(RDBookDetailModel *)detailBook
{
    NSArray *arr =  [[RDModelAgent agent] createModel:RDBookDetailModel.class fromJson:self.httpModel.data];
    return [arr objectAtIndexSafely:0];
}
@end

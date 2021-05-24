//
//  RDCharpterApi.m
//  Reader
//
//  Created by 陈保瑞 on 2020/12/24.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDCharpterApi.h"
#import "RDCharpterModel.h"
@implementation RDCharpterApi
- (NSString *)requestUrl {
    return @"/app/open/api/chapter/getByBookId";
}
-(id)requestArgument
{
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"bookId":@(self.bookId),
        @"chapterId":@(self.chapterId)
    };
}
-(NSString *)name
{
    return self.httpModel.data[@"title"];
}
-(NSString *)author
{
    return self.httpModel.data[@"author"];
}
-(NSArray *)charpters
{
    NSArray *charpters = [[RDModelAgent agent] createModel:RDCharpterModel.class fromJson:self.httpModel.data[@"chapters"]];
    if (charpters.count>0) {
        [charpters setValue:@(self.bookId) forKeyPath:@"bookId"];
        [charpters setValue:self.name forKeyPath:@"bookName"];
        [charpters setValue:self.author forKeyPath:@"author"];
    }
    return charpters;
}
@end

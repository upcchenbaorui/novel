//
//  RDCheckApi.m
//  Reader
//
//  Created by yuenov on 2020/3/6.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDCheckApi.h"
#import "RDCharpterModel.h"

@implementation RDCheckApi
- (NSString *)requestUrl {
    return @"/app/open/api/book/checkUpdate";
}
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

-(id)requestArgument
{
    NSMutableArray *array = [NSMutableArray array];
    for (RDCharpterModel *chapter in self.books) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"bookId"] = @(chapter.bookId);
        dic[@"chapterId"] = @(chapter.charpterId);
        [array addObject:dic];
    }
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"books":array
    };
    
}
-(NSArray *)updateBooks
{
    return self.httpModel.data[@"updateList"];
}
@end

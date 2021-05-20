//
//  RDCyharpterContentApi.m
//  Reader
//
//  Created by yuenov on 2019/12/29.
//  Copyright © 2019 yuenov. All rights reserved.
//

#import "RDCharpterContentApi.h"

@implementation RDCharpterContentApi
- (NSString *)requestUrl {
    return @"/app/open/api/chapter/get?open_access_token=60737a4b-42ef-4502-bb87-501c2c2663ab";
}
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
-(id)requestArgument
{
    
    return @{
        @"open_access_token" : @"60737a4b-42ef-4502-bb87-501c2c2663ab",
        @"chapterIdList":MakeNSArray(self.charpters),
        @"bookId":@(self.bookId),
    };
}



-(NSArray *)charptersContent
{
    NSArray *charpters = [[RDModelAgent agent] createModel:RDCharpterModel.class fromJson:self.httpModel.data[@"list"]];;
    if (charpters.count>0) {
        [charpters setValue:@(self.bookId) forKeyPath:@"bookId"];
    }
    return charpters;
}
@end

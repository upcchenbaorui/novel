//
//  RDForceUpdateApi.m
//  Reader
//
//  Created by 陈保瑞 on 2020/4/5.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDForceUpdateApi.h"
#import "RDCharpterModel.h"

@implementation RDForceUpdateApi
- (NSString *)requestUrl {
    return @"/app/open/api/chapter/updateForce";
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

//
//  BookInfoModel.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/27.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "BookInfoModel.h"

@implementation BookInfoModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *dic = @{
        @"bookId" : @"book_id",
        @"bookName" : @"book_name",
        @"imageurl" : @"image_url",
        @"userId" : @"user_id",
    };
    return [[JSONKeyMapper alloc] initWithModelToJSONBlock:^NSString *(NSString *keyName) {
        return dic[keyName] ? : keyName;
    }];
}

@end

@implementation UserInfoModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *dic = @{
        @"userId" : @"user_id"
    };
    return [[JSONKeyMapper alloc] initWithModelToJSONBlock:^NSString *(NSString *keyName) {
        return dic[keyName] ? : keyName;
    }];
}

@end

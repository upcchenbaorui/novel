//
//  RegisterModel.m
//  Reader
//
//  Created by 陈保瑞 on 2021/7/2.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RegisterModel.h"

@implementation NetworkModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *dic = @{
        
    };
    return [[JSONKeyMapper alloc] initWithModelToJSONBlock:^NSString *(NSString *keyName) {
        return dic[keyName] ? : keyName;
    }];
}

@end

@implementation DataModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *dic = @{
        @"bookInfoList" : @"book",
        @"userInfo" : @"user_info",
    };
    return [[JSONKeyMapper alloc] initWithModelToJSONBlock:^NSString *(NSString *keyName) {
        return dic[keyName] ? : keyName;
    }];
}

@end

//
//  RDHttpModel.m
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDHttpModel.h"

@implementation RDHttpModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"code": @"result.code",
            @"msg": @"result.msg",
            @"data": @"data",
    };
}
@end

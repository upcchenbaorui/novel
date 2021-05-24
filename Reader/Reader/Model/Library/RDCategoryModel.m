//
//  RDCategoryModel.m
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDCategoryModel.h"

@implementation RDCategoryModel
+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{
        @"name":@"categoryName",
        @"type":@"categoryId"
    };
}

@end

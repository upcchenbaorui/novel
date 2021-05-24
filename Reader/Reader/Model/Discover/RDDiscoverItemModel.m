//
//  RDDiscoverItemModel.m
//  Reader
//
//  Created by 陈保瑞 on 2020/10/28.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDDiscoverItemModel.h"

@implementation RDDiscoverItemModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.size = 8;
    }
    return self;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"categories": @"bookList",
            @"title":@"categoryName",
    };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"categories": [RDLibraryDetailModel class]
    };
}
@end

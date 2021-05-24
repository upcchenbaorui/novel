//
//  RDCommParamManager.m
//  Reader
//
//  Created by 陈保瑞 on 2020/4/5.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDCommParamManager.h"
#import "RDModelAgent.h"

@implementation RDCommParamManager
+ (instancetype)sharedInstance
{
    static RDCommParamManager *model = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        model = [[RDModelAgent agent] readModelForClass:[self class]];
        if (!model) {
            model = [RDCommParamManager new];
        }
    });
    
    return model;
}
@end

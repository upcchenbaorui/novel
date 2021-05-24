//
//  RDDatabaseManager.m
//  Reader
//
//  Created by 陈保瑞 on 2020/12/29.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDDatabaseManager.h"

#import "RDCharpterModel.h"
#import "RDBookDetailModel.h"


@implementation RDDatabaseManager

+ (RDDatabaseManager *)sharedInstance
{
    static RDDatabaseManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
            sharedInstance.database = [[WCTDatabase alloc]initWithPath:[PATH_DOCUMENT stringByAppendingPathComponent:kBookDatabase]];
            [sharedInstance.database createTableAndIndexesOfName:kCharpterTable withClass:RDCharpterModel.class];
            [sharedInstance.database createTableAndIndexesOfName:kReadRecordTable withClass:RDBookDetailModel.class];
            [sharedInstance.database createTableAndIndexesOfName:kHistoryRecordTable withClass:RDBookDetailModel.class];
        }
    });
    
    return sharedInstance;
}
@end

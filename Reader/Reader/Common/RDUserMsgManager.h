//
//  RDUserMsgManager.h
//  Reader
//
//  Created by 陈保瑞 on 2021/6/18.
//  Copyright © 2021 LSY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDUserMsgManager : NSObject

+ (BOOL)userIsLogin;

+ (void)setIp:(NSString *)ip;

+ (NSString *)ip;

+ (void)userDidLogin:(NSString *) userId userName:(NSString *)userName;

+ (void)userDidUnLogin;

+ (NSString *)userId;

+ (NSString *)userName;
@end

NS_ASSUME_NONNULL_END

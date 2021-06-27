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

+ (void)setIp:(NSString *)ip;
+ (NSString *)ip;

+ (void)userDidLogin:(NSString *)phone username:(NSString *)username;

+ (void)userDidUnLogin;

@end

NS_ASSUME_NONNULL_END

//
//  RDUserMsgManager.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/18.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDUserMsgManager.h"

@implementation RDUserMsgManager

+ (void)userDidLogin:(NSString *)phone username:(NSString *)username {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:username forKey:@"username"];
    [defaults setObject:phone forKey:@"phone"];
}

+ (void)userDidUnLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"username"];
    [defaults removeObjectForKey:@"phone"];
}

@end

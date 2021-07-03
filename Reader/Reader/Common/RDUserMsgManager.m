//
//  RDUserMsgManager.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/18.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDUserMsgManager.h"

@implementation RDUserMsgManager

+ (BOOL)userIsLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [defaults objectForKey:@"userId"];
    if(str == nil || str.length == 0) {
        return NO;
    }
    return YES;
}

+ (NSString *)userId {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"userId"];
}

+ (void)userDidLogin:(NSString *)userId userName:(NSString *)userName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userId forKey:@"userId"];
    [defaults setObject:userName forKey:@"userName"];
}


+ (void)userDidUnLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"userId"];
}

+ (void)setIp:(NSString *)ip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:ip forKey:@"ip"];
}

+ (NSString *)ip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"ip"];
}

+ (NSString *)userName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"userName"];
}

@end

//
//  AppDelegate.h
//  Reader
//
//  Created by 陈保瑞 on 2020/10/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RDMainController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong,readonly) RDMainController *mainController;

#define RDAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
@end


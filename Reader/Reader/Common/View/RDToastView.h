//
//  RDToastView.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "MBProgressHUD.h"
#define kAnimateDelay 1.5

@interface RDToastView : MBProgressHUD
+(void)showText:(NSString *)text delay:(NSTimeInterval)delay inView:(UIView *)view;


+(void)showText:(NSString *)text delay:(NSTimeInterval)delay inView:(UIView *)view dismiss:(void(^)(void))dismiss;
@end


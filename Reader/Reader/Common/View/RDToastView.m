//
//  RDToastView.m
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDToastView.h"

@implementation RDToastView

+(void)showText:(NSString *)text delay:(NSTimeInterval)delay inView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];

    // Set the text mode to show only text.
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    [hud hideAnimated:YES afterDelay:delay];
}

+(void)showText:(NSString *)text delay:(NSTimeInterval)delay inView:(UIView *)view dismiss:(void(^)(void))dismiss
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    [hud hideAnimated:YES afterDelay:delay];
    [hud setCompletionBlock:^{
        if (dismiss) {
            dismiss();
        }
    }];
}

@end

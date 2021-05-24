//
//  RDNavigationController.m
//  Reader
//
//  Created by 陈保瑞 on 2020/10/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDNavigationController.h"

@interface RDNavigationController ()

@end

@implementation RDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.hidden = YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end

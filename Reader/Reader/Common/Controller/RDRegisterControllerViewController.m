//
//  RDRegisterControllerViewController.m
//  Reader
//
//  Created by 陈保瑞 on 2021/5/20.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDRegisterControllerViewController.h"
#import "RDRegisterView.h"

@interface RDRegisterControllerViewController ()

@property (nonatomic, strong) UIView *registerView;

@end

@implementation RDRegisterControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    self.topView.titleLabel.text = @"注册";
    self.registerView = [[RDRegisterView alloc] init];
    self.registerView.frame = CGRectMake(0, self.topView.bottom, self.view.width, self.view.height - self.topView.bottom);
    [self.view addSubview:self.registerView];

}



@end

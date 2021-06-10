//
//  RDAboutUsControllerViewController.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/10.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDAboutUsControllerViewController.h"

@interface RDAboutUsControllerViewController ()

@property (nonatomic, copy) UILabel *contentLabel;

@end

@implementation RDAboutUsControllerViewController

- (UILabel *)contentLabel {
    if(!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = RDFont20;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = RDBlackColor;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.topView = [[RDTopView alloc] initWithBackStyle];
    self.topView.titleLabel.text = self.title;
    [self.topView.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.topView];
    
    self.contentLabel.text = self.contentStr;
    [self.view addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120);
        make.left.mas_equalTo(kBackBtnWidth);
        make.right.mas_equalTo(-kBackBtnWidth);
    }];
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

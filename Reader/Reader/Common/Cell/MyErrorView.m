//
//  MyErrorView.m
//  Reader
//
//  Created by 陈保瑞 on 2021/5/31.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "MyErrorView.h"

const CGFloat kLeftRightMargin = 12;
@interface MyErrorView()

@property(nonatomic, strong) UIView *bgView;
@end
@implementation MyErrorView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bgView = [[UIView alloc] init];
        [self addSubview:self.bgView];
        self.bgView.backgroundColor = [UIColor grayColor];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        self.bgView.layer.cornerRadius = 4;
        
        self.msgLabel = [[UILabel alloc] init];
        [self.bgView addSubview:self.msgLabel];
        self.msgLabel.font = [UIFont systemFontOfSize:14];
        self.msgLabel.textColor = [UIColor blackColor];
        [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kLeftRightMargin);
            make.right.mas_equalTo(-kLeftRightMargin);
            make.center.mas_equalTo(0);
        }];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

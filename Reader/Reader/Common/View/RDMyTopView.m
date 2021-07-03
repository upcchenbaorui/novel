//
//  RDMyTopView.m
//  Reader
//
//  Created by 陈保瑞 on 2021/5/31.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDMyTopView.h"
#import "RDUserMsgManager.h"

@interface RDMyTopView()

@property(nonatomic, strong) UIImageView *imgView;
@property(nonatomic, strong) UILabel *nameLabel;

@end

@implementation RDMyTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    self.imgView = [[UIImageView alloc] init];
    self.imgView.image = [UIImage imageNamed:@"app_icon_white70"];
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(80);
        make.top.mas_equalTo(70);
    }];

    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:18];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.nameLabel];
    self.nameLabel.text = [NSString stringWithFormat:@"ID:%@",[RDUserMsgManager userName]];
    self.nameLabel.numberOfLines = 1;
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(18);
        make.centerX.mas_equalTo(0);
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
    }];
    

    
}
@end

//
//  MyTableViewCell.m
//  Reader
//
//  Created by 陈保瑞 on 2021/5/31.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "MyTableViewCell.h"
#import "CommonStrings.h"

const CGFloat kTopAndBottomMargin = 10;
const CGFloat kLeftAndRightMargin = 15;
@interface MyTableViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        [self setupConstraints];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.msgLabel];
    [self.contentView addSubview:self.arrowView];
    [self.contentView addSubview:self.bottomLine];
}

- (void)setupConstraints {
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kTopAndBottomMargin);
        make.bottom.mas_equalTo(-kTopAndBottomMargin);
        make.size.mas_equalTo(30);
        make.left.mas_equalTo(kLeftAndRightMargin);
    }];
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-kLeftAndRightMargin);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(17);
    }];
    
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(kLeftAndRightMargin);
        make.right.mas_equalTo(self.arrowView.mas_left).offset(-kLeftAndRightMargin);
        make.centerY.mas_equalTo(0);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(kLeftAndRightMargin);
        make.right.mas_equalTo(-kLeftAndRightMargin);
    }];
    
}

- (void)updateWithNumber:(NSInteger)num {
    if(num == yijianfankui) {
        self.msgLabel.text = @"意见反馈";
        self.iconView.image = [UIImage imageNamed:@"wode_help"];
    } else if(num == liulanjilu) {
        self.msgLabel.text = @"浏览记录";
        self.iconView.image = [UIImage imageNamed:@"wode_history"];
    } else if(num == yuedupianhao) {
        self.msgLabel.text = @"阅读偏好";
        self.iconView.image = [UIImage imageNamed:@"wode_favor"];
    } else if(num == guanyuwomen) {
        self.msgLabel.text = @"关于我们";
        self.iconView.image = [UIImage imageNamed:@"wode_about"];
    } else if(num == fenxinag) {
        self.msgLabel.text = @"分享";
        self.iconView.image = [UIImage imageNamed:@"wode_share"];
    } else if(num == changjianwenti) {
        self.msgLabel.text = @"常见问题";
        self.iconView.image = [UIImage imageNamed:@"wode_develop"];
    }
    
}

- (UIImageView *)iconView {
    if(!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)msgLabel {
    if(!_msgLabel) {
        _msgLabel = [[UILabel alloc] init];
        _msgLabel.font = [UIFont systemFontOfSize:16];
        _msgLabel.textColor = [UIColor blackColor];
    }
    return _msgLabel;
}

- (UIImageView *)arrowView {
    if(!_arrowView) {
        _arrowView = [[UIImageView alloc] init];
        _arrowView.image = [UIImage imageNamed:@"me_arrow"];
    }
    return _arrowView;
}

- (UIView *)bottomLine {
    if(!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor blackColor];
        _bottomLine.alpha = 0.1;
    }
    return _bottomLine;
}
@end

//
//  RDBrowerRecordCell.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/16.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDBrowerRecordCell.h"
#import "RDLayoutButton.h"

@interface RDBrowerRecordCell()

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) RDLayoutButton *detailButton;

@end

@implementation RDBrowerRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.authorLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.detailButton];
        [self setupConstraints];
    }
    return self;
}

-(void)setupConstraints {
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(6);
        make.bottom.mas_equalTo(-6);
        make.width.mas_equalTo(60);
    }];
    self.headImageView.layer.cornerRadius = 6;
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headImageView).offset(2);
        make.left.mas_equalTo(self.headImageView.mas_right).offset(6);
        make.right.mas_equalTo(self.detailButton.mas_left).offset(-36 - 3);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(3 + 2);
        make.left.mas_equalTo(self.headImageView.mas_right).offset(6);
        make.right.mas_equalTo(self.detailButton.mas_left).offset(-36 - 3);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.authorLabel.mas_bottom).offset(3 + 2);
        make.left.mas_equalTo(self.headImageView.mas_right).offset(6);
        make.right.mas_equalTo(self.detailButton.mas_left).offset(-36 - 3);
    }];
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-6);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    }];
    
}

-(void)setModel:(RDBookDetailModel *)model
{
    _model = model;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[RDUtilities buildPicUrlWithPath:model.coverImg]] placeholderImage:[UIImage imageNamed:@"app_placeholder"]];
    [self.nameLabel setText:model.title];
    [self.authorLabel setText:model.author];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:model.readTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    self.descLabel.text = [formatter stringFromDate:date];

}

- (UIImageView *)headImageView {
    if (!_headImageView){
        _headImageView = [[UIImageView alloc] init];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.clipsToBounds = YES;
        _headImageView.userInteractionEnabled = YES;
    }
    return _headImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel){
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = RDBoldFont17;
        _nameLabel.textColor = RDBlackColor;
    }
    return _nameLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel){
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.font = RDFont13;
        _authorLabel.textColor = RDGrayColor;
    }
    return _authorLabel;
}

- (UILabel *)descLabel {
    if (!_descLabel){
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = RDBlackColor;
        _descLabel.font = RDFont13;
    }
    return _descLabel;
}

- (RDLayoutButton *)detailButton {
    if (!_detailButton){
        _detailButton = [[RDLayoutButton alloc] init];
        [_detailButton setTitle:@"继续阅读" forState:UIControlStateNormal];
        [_detailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _detailButton.backgroundColor = RDGreenColor;
        _detailButton.layer.cornerRadius = 4;
        _detailButton.layoutType = WidButtonLayoutReverseHorizon;
        _detailButton.titleLabel.font = RDFont15;
        _detailButton.userInteractionEnabled = NO;
    }
    return _detailButton;
}
+(CGFloat)categoryCellHeigh:(RDLibraryDetailModel *)model
{
    
    CGFloat height = [[NSMutableAttributedString strWithFont:RDFont13 lineSpace:6 string:model.desc] sizewithFont:RDFont13 lineSpace:6 maxWidth:ScreenWidth-60].height;
    CGFloat descHeight = height>160?160:height;
    
    return 15+45+20+descHeight+20+10+10;
}

@end

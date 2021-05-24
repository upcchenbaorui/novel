//
//  RDLoadIngView.m
//  Reader
//
//  Created by 陈保瑞 on 2020/12/24.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDLoadIngView.h"
#import "KafkaReplicatorLayer.h"

@interface RDLoadIngView ()
@property (nonatomic,strong) KafkaReplicatorLayer *replicator;
@end

@implementation RDLoadIngView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.replicator];
    }
    return self;
}

-(KafkaReplicatorLayer *)replicator
{
    if (!_replicator) {
        _replicator = [KafkaReplicatorLayer layer];
        _replicator.animationStyle = KafkaReplicatorLayerAnimationStyleAllen;
        _replicator.themeColor = RDGreenColor;
    }
    return _replicator;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = CGSizeMake(60, 40);
    self.replicator.frame = CGRectMake((self.width-size.width)/2, (self.height-size.height)/2, size.width, size.height);
}
-(void)begin
{
    [self.replicator startAnimating];
}
-(void)end
{
    [self.replicator stopAnimating];
}
@end

//
//  RDSearchView.m
//  Reader
//
//  Created by 陈保瑞 on 2020/10/24.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDSearchView.h"
#import "RDSearchHistoryModel.h"
#import "RDBookDetailModel.h"
#import "RDConfigModel.h"

#define kRDLoginSuccess @"kRDLoginSuccess"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kSearchHeight 35

@interface RDSearchView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *searchLabel1;
@property (nonatomic, strong) UILabel *searchLabel2;
@property (nonatomic, strong) NSMutableArray *searchSource;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger index;

@end
@implementation RDSearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.searchSource = [[NSMutableArray alloc] init];
        NSArray *arr = [[RDSearchHistoryModel getModel] allWords];
        for(NSString *model in arr) {
            [self.searchSource addObject:model];
        }
        arr = [RDConfigModel getModel].hotSearch;
        for(RDBookDetailModel *model in arr) {
            [self.searchSource addObject:model.title];
        }
        
        self.index = 0;
        
        
        self.imageView.frame = CGRectMake(12, 10, 15, 15);
        [self addSubview:self.imageView];
        self.searchLabel2.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 10, kSearchHeight -1, kScreenWidth -12-15-10-20, kSearchHeight);
        [self addSubview:self.searchLabel2];
        self.searchLabel1.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 10, 0, kScreenWidth -12-15-10-20, kSearchHeight);
        [self updateTitleText];
        [self addSubview:self.searchLabel1];
        
        self.backgroundColor = [UIColor colorWithHexValue:0xf1f2f5];
        [self addGestureRecognizer:({
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
            tap;
        })];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupTimer) name:kRDLoginSuccess object:nil];
        self.layer.cornerRadius = 35 / 2;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setupTimer {
    if(self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.f target:self selector:@selector(animateTitle) userInfo:nil repeats:YES];
}

- (void)animateTitle {
    [UIView animateWithDuration:0.3 animations:^{
        self.searchLabel2.alpha = 1;
        self.searchLabel1.alpha = 0;
        
        [self.searchLabel2 setFrame:CGRectMake(self.searchLabel2.frame.origin.x, self.searchLabel2.frame.origin.y - kSearchHeight, self.searchLabel2.frame.size.width, self.searchLabel2.frame.size.height)];
        [self.searchLabel1 setFrame:CGRectMake(self.searchLabel1.frame.origin.x, self.searchLabel1.frame.origin.y - kSearchHeight, self.searchLabel1.frame.size.width, self.searchLabel1.frame.size.height)];
        
    } completion:^(BOOL finished) {
        self.searchLabel2.alpha = 0;
        self.searchLabel1.alpha = 1;
        
        [self.searchLabel2 setFrame:CGRectMake(self.searchLabel2.frame.origin.x, self.searchLabel2.frame.origin.y + kSearchHeight, self.searchLabel2.frame.size.width, self.searchLabel2.frame.size.height)];
        [self.searchLabel1 setFrame:CGRectMake(self.searchLabel1.frame.origin.x, self.searchLabel1.frame.origin.y + kSearchHeight, self.searchLabel1.frame.size.width, self.searchLabel1.frame.size.height)];
        
        [self nextTitleIndex];
        [self updateTitleText];
    }];
}

- (void)nextTitleIndex {
    NSInteger count = [self.searchSource count];
    if(count <= 0) return;
    self.index = self.index + 1;
    self.index %= count;
}

- (void)updateTitleText {
    NSInteger count = [self.searchSource count];
    if(count <= 0) return;
    self.searchLabel1.text = [self.searchSource objectAtIndex:self.index];
    self.searchLabel2.text = [self.searchSource objectAtIndex:(self.index + 1) % count];
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:@"icon_reading_search"];
    }
    return _imageView;
}

-(UILabel *)searchLabel1
{
    if (!_searchLabel1) {
        _searchLabel1 = [[UILabel alloc] init];
        _searchLabel1.font = RDFont15;
        _searchLabel1.textColor = RDLightGrayColor;
    }
    return _searchLabel1;
}

- (UILabel *)searchLabel2 {
    if (!_searchLabel2) {
        _searchLabel2 = [[UILabel alloc] init];
        _searchLabel2.font = RDFont15;
        _searchLabel2.textColor = RDLightGrayColor;
        _searchLabel2.alpha = 0;
    }
    return _searchLabel2;
}


#pragma mark - action

-(void)click{
    if ([self.delegate respondsToSelector:@selector(searchViewDidSelect:)]) {
        [self.delegate searchViewDidSelect:([self.searchSource objectAtIndex:self.index])];
    }
}

@end

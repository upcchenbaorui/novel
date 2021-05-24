//
//  RDCategoryController.m
//  Reader
//
//  Created by 陈保瑞 on 2020/2/25.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDCategoryController.h"
#import "RDAllCategoryApi.h"
#import "RDCategoryContentController.h"
@interface RDCategoryController ()
@property (nonatomic,strong) NSArray <RDChannelModel *>*channels;
@property (nonatomic,strong) NSMutableArray <RDCategoryContentController *> *controllers;
@property(nonatomic, strong) RDLayoutButton *backBtn;
@end

@implementation RDCategoryController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeNormal = 16.f;
        self.titleSizeSelected = 16.f;
        self.titleColorNormal = RDGrayColor;
        self.titleColorSelected = RDGreenColor;
        self.menuView.delegate = self;
    }
    return self;
}
- (RDLayoutButton *)backBtn {
    if (!_backBtn) {
        RDLayoutButton *button = [[RDLayoutButton alloc] initWithFrame:CGRectMake(0, 0, kBackBtnWidth - 20, [UIView navigationBar])];
        button.adjustsImageWhenDisabled = NO;
        [button setImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateNormal];
        button.imageSize = CGSizeMake(11, 19);
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        _backBtn = button;
        
    }

    return _backBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetch];
}

-(void)fetch
{
    RDAllCategoryApi *api = [[RDAllCategoryApi alloc] init];
    [self showLoadingGifWithCancel:^{
        [api stop];
    }];
    [api startWithCompletionBlock:^(RDBaseApi * _Nonnull request, NSString * _Nonnull error) {
        [self hideLoadingGif];
        if (!error) {
            self.channels = api.channel;
            for (RDChannelModel *model in self.channels) {
                RDCategoryContentController *controller = [[RDCategoryContentController alloc] init];
                controller.model = model;
                [self.controllers addObject:controller];
                [self reloadData];
                self.menuView.leftView = self.backBtn;
            }
            
        }
        else{
            [self showErrorWithString:error];
        }
    }];
}
-(void)reloadFetch
{
    [self hiddenError];
    [self fetch];
}

-(NSMutableArray <RDCategoryContentController *>*)controllers
{
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - WMPageControllerDataSource

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.controllers.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return [self.controllers objectAtIndexSafely:index];
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return [self.channels objectAtIndex:index].channel;
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, [UIView statusBar], ScreenWidth,[UIView navigationBar]);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, [UIView statusBar] + [UIView navigationBar], ScreenWidth, self.view.height - [UIView statusBar] - [UIView navigationBar]);
}

@end

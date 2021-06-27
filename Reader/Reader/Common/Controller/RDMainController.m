//
//  RDMainController.m
//  Reader
//
//  Created by 陈保瑞 on 2020/10/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDMainController.h"
#import "UIView+rd_dispalyInfo.h"
#import "RDBookshelfController.h"
#import "RDDiscoverController.h"
#import "RDLibraryController.h"
#import "RDVTabBarItem.h"
#import "UIColor+rd_wid.h"
#import "NSArray+rd_wid.h"
#import "UIView+rd_wid.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "MyViewController.h"
#import "RDLoginView.h"
#import <Masonry/Masonry.h>
#import "RDRegisterControllerViewController.h"
#import "MyErrorView.h"
#import "RDUserMsgManager.h"
#import "RDNetWorkManager.h"

#define kRDLoginSuccess @"kRDLoginSuccess"

#define isNeedLogin 0

@interface RDMainController () <showErrorViewProtocol>

@property (nonatomic, strong) RDLoginView *loginView;
@property (nonatomic,strong) MyErrorView *errorView;

@end

@implementation RDMainController

- (void)addErrorView {
    self.errorView = [[MyErrorView alloc] init];
    [self.view addSubview:self.errorView];
    [self.errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).offset(-90);
        make.height.mas_equalTo(35);
    }];
    self.errorView.hidden = YES;
}

- (void)showErrorView:(NSString *)text {
    self.errorView.msgLabel.text = text;
    [self.view bringSubviewToFront:self.errorView];
    self.errorView.hidden = NO;
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.errorView.alpha = 0;
        } completion:^(BOOL finish){
            self.errorView.hidden = YES;
            self.errorView.alpha = 1;
        }
    ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addErrorView];
    [RDUserMsgManager setIp:@"10.227.29.35"];
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationController.navigationBarHidden = YES;
    if (@available(iOS 11.0, *)) {
        CGFloat safeAreaBottom = UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom;
         self.tabBar.contentEdgeInsets = UIEdgeInsetsMake(0, 0,  safeAreaBottom / 1.5f, 0);
    }
    self.delegate = self;
    self.fd_prefersNavigationBarHidden = YES;
   [self initSetup];
    
    self.loginView = [[RDLoginView alloc] init];
    self.loginView.frame = self.view.frame;
    __weak typeof (self) weakSelf = self;
    self.loginView.registerBlock = ^{
        [weakSelf.navigationController pushViewController:[[RDRegisterControllerViewController alloc] init] animated:YES];
    };
    self.loginView.loginBlock = ^(NSString * _Nonnull userId, NSString * _Nonnull pwd) {
        [weakSelf login:userId pwd:pwd];
    };
    
    [self.view addSubview:self.loginView];
}

- (BOOL)judge:(NSString *)str type:(NSInteger)type {
    if(str == nil || [str isEqualToString:@""]) {
        return false;
    }
    if(str.length < 6 || str.length > 11) {
        return false;
    }
    if(type == 0) {
        char x = [str characterAtIndex:0];
        if(x >= 'a' && x <= 'z') {
            
        } else if(x >= 'A' && x <= 'Z') {
            
        } else {
            return false;
        }
    } else {
        int flag = 0;
        for(int i = 0; i < str.length; ++ i) {
            char x = [str characterAtIndex:i];
            if(x >= '0' && x <= '9') {
                flag |= 1;
            }
            else {
                flag |= 2;
            }
        }
        if(flag != 3) {
            return false;
        }
    }
    return true;
}

- (void)login:(NSString *)userId pwd:(NSString *)pwd {
    if(isNeedLogin) {
        if(![self judge:userId type:0]) {
            [self showErrorView:@"您的 ID 不符合要求"];
            return;
        }
        if(![self judge:pwd type:1]) {
            [self showErrorView:@"您的密码 不符合要求"];
            return;
        }
    }
    [RDNetWorkManager userLogin:userId pwd:pwd];
    
    [self hiddenLoginView];
}

- (void)hiddenLoginView {
    [[NSNotificationCenter defaultCenter] postNotificationName:kRDLoginSuccess object:nil userInfo:nil];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.loginView.alpha = 1;
            CGRect frame = self.loginView.frame;
            self.loginView.frame = CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height);
            
        } completion:^(BOOL finish){
            self.loginView.frame = CGRectMake(0, 0, self.loginView.width, self.loginView.height);
            self.loginView.hidden = YES;
            self.loginView.alpha = 1;
        }
    ];
}

-(void)initSetup{
    self.viewControllers = @[({
        RDBookshelfController *bookshelfController = [[RDBookshelfController alloc] init];
        bookshelfController;
    }),({
        RDDiscoverController *discoverController = [[RDDiscoverController alloc] init];
        discoverController;
    }),({
        RDLibraryController *libraryController = [[RDLibraryController alloc] init];
        libraryController;
    }),({
         MyViewController* myController = [[MyViewController alloc] init];
         myController;
    })];

    NSArray *normalIcons = @[@"tabbar_unselect",@"tabbar_faxian_unselect",@"tabbar_shucheng_unselect",@"tabbar_wo_unselect"];
    NSArray *selectedIcons = @[@"tabbar_select",@"tabbar_faxian_select",@"tabbar_shucheng_select",@"tabbar_wo_select"];
    NSArray *titleArray = @[@"书架",@"发现", @"书城", @"我"];
    for (int i = 0; i < self.tabBar.items.count; ++i) {
        RDVTabBarItem *item = self.tabBar.items[i];
        item.backgroundColor = [UIColor colorWithHexValue:0xf9f9f9];
        item.title = [titleArray objectAtIndexSafely:i];
        item.titlePositionAdjustment = UIOffsetMake(0, 4);
        NSDictionary *tabBarTitleUnselectedDic = @{NSForegroundColorAttributeName: [UIColor colorWithHexValue:0xc5c5c7], NSFontAttributeName: [UIFont systemFontOfSize:11]};
        NSDictionary *tabBarTitleSelectedDic = @{NSForegroundColorAttributeName: [UIColor colorWithHexValue:0x23b383], NSFontAttributeName: [UIFont systemFontOfSize:11]};
        item.selectedTitleAttributes = tabBarTitleSelectedDic;
        item.unselectedTitleAttributes = tabBarTitleUnselectedDic;
        [item setFinishedSelectedImage:[UIImage imageNamed:selectedIcons[i]] withFinishedUnselectedImage:[UIImage imageNamed:normalIcons[i]]];
        [item removeTarget:self.tabBar action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchDown];
        [item addTarget:self.tabBar action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    //添加分割线
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, -1 / [UIScreen mainScreen].scale, self.tabBar.width, 1 / [UIScreen mainScreen].scale)];
    separatorView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    separatorView.backgroundColor = [UIColor colorWithHexValue:0xcdcdce];
    [self.tabBar addSubview:separatorView];
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

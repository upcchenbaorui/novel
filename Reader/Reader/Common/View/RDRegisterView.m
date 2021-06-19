//
//  RDRegisterView.m
//  Reader
//
//  Created by 陈保瑞 on 2021/5/24.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDRegisterView.h"
#import "MyErrorView.h"
#define mainSize    [UIScreen mainScreen].bounds.size

#define offsetLeftHand      60

#define rectLeftHand        CGRectMake(61-offsetLeftHand, 90, 40, 65)
#define rectLeftHandGone    CGRectMake(mainSize.width / 2 - 100, vLogin.frame.origin.y - 22, 40, 40)

#define rectRightHand       CGRectMake(imgLogin.frame.size.width / 2 + 60, 90, 40, 65)
#define rectRightHandGone   CGRectMake(mainSize.width / 2 + 62, vLogin.frame.origin.y - 22, 40, 40)

@interface RDRegisterView() <showErrorViewProtocol>
{
    UITextField* txtUser;
    UITextField* txtPwd;
    
    UIImageView* imgLeftHand;
    UIImageView* imgRightHand;
    
    UIImageView* imgLeftHandGone;
    UIImageView* imgRightHandGone;
    
    JxbLoginShowType showType;
}
@property (nonatomic, strong)MyErrorView *errorView;
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, strong)UILabel *hintLabel;

@end

@implementation RDRegisterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addErrorView];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIImageView* imgLogin = [[UIImageView alloc] initWithFrame:CGRectMake(mainSize.width / 2 - 211 / 2, 100, 211, 109)];
    imgLogin.image = [UIImage imageNamed:@"owl-login"];
    imgLogin.layer.masksToBounds = YES;
    [self addSubview:imgLogin];
    
    imgLeftHand = [[UIImageView alloc] initWithFrame:rectLeftHand];
    imgLeftHand.image = [UIImage imageNamed:@"owl-login-arm-left"];
    [imgLogin addSubview:imgLeftHand];
    
    imgRightHand = [[UIImageView alloc] initWithFrame:rectRightHand];
    imgRightHand.image = [UIImage imageNamed:@"owl-login-arm-right"];
    [imgLogin addSubview:imgRightHand];

    UIView* vLogin = [[UIView alloc] initWithFrame:CGRectMake(15, 200, mainSize.width - 30, 170 + 25)];
    vLogin.layer.borderWidth = 0.5;
    vLogin.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    vLogin.backgroundColor = [UIColor whiteColor];
    [self addSubview:vLogin];
    
    imgLeftHandGone = [[UIImageView alloc] initWithFrame:rectLeftHandGone];
    imgLeftHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self addSubview:imgLeftHandGone];
    
    imgRightHandGone = [[UIImageView alloc] initWithFrame:rectRightHandGone];
    imgRightHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self addSubview:imgRightHandGone];
    
    txtUser = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, vLogin.frame.size.width - 60, 44)];
    txtUser.delegate = self;
    txtUser.placeholder = @"请输入账号（字母开头 6-11 位）";
    txtUser.keyboardType = UIKeyboardTypeAlphabet;
    txtUser.layer.cornerRadius = 5;
    txtUser.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtUser.layer.borderWidth = 0.5;
    txtUser.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    txtUser.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [txtUser.leftView addSubview:imgUser];
    [vLogin addSubview:txtUser];
    
    txtPwd = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, vLogin.frame.size.width - 60, 44)];
    txtPwd.delegate = self;
    txtPwd.layer.cornerRadius = 5;
    txtPwd.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtPwd.layer.borderWidth = 0.5;
    txtPwd.secureTextEntry = YES;
    txtPwd.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    txtPwd.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgPwd.image = [UIImage imageNamed:@"iconfont-password"];
    [txtPwd.leftView addSubview:imgPwd];
    [vLogin addSubview:txtPwd];
    
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registerBtn.frame = CGRectMake(30 + txtPwd.frame.size.width - 67, 150, 55, 33);
    [self.registerBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.registerBtn.layer.borderWidth = 0.5;
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.registerBtn.tintColor = [UIColor blackColor];
    [vLogin addSubview:self.registerBtn];
    
    self.hintLabel = [[UILabel alloc] init];
    self.hintLabel.font = [UIFont systemFontOfSize:12];
    self.hintLabel.frame = CGRectMake(30, 150, 200, 33);
    self.hintLabel.text = @" 密码要求：字母与数字混合 6-11 位";
    [vLogin addSubview:self.hintLabel];
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

- (void)click {
    NSString *ID = txtUser.text;
    NSString *pwd = txtPwd.text;
    if(![self judge:ID type:0]) {
        [self showErrorView:@"您的 ID 不符合要求"];
        return;
    }
    if(![self judge:pwd type:1]) {
        [self showErrorView:@"您的密码 不符合要求"];
        return;
    }
}

- (void)addErrorView {
    self.errorView = [[MyErrorView alloc] init];
    [self addSubview:self.errorView];
    [self.errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).offset(-90);
        make.height.mas_equalTo(35);
    }];
    self.errorView.hidden = YES;
}

- (void)showErrorView:(NSString *)text {
    self.errorView.msgLabel.text = text;
    [self bringSubviewToFront:self.errorView];
    self.errorView.hidden = NO;
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.errorView.alpha = 0;
        } completion:^(BOOL finish){
            self.errorView.hidden = YES;
            self.errorView.alpha = 1;
        }
    ];
}

@end

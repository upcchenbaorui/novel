//
//  MyErrorView.h
//  Reader
//
//  Created by 陈保瑞 on 2021/5/31.
//  Copyright © 2021 LSY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol showErrorViewProtocol <NSObject>

@required
- (void)showErrorView:(NSString *)text;
@required
- (void)addErrorView;

@end

@interface MyErrorView : UIView

@property(nonatomic, strong) UILabel *msgLabel;

@end

NS_ASSUME_NONNULL_END

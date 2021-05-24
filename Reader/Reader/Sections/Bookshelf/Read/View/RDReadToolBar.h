//
//  RDReadToolBar.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/13.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDLayoutButton.h"
NS_ASSUME_NONNULL_BEGIN
@protocol RDReadToolBarDelegate <NSObject>
@optional
-(void)didMenu;
-(void)didSlider;
-(void)didLight;
-(void)didSetting;
@end
@interface RDReadToolBar : UIView
@property (nonatomic,weak) id<RDReadToolBarDelegate>delegate;
@property (nonatomic,strong) RDLayoutButton *menu;
@property (nonatomic,strong) RDLayoutButton *slider;
@property (nonatomic,strong) RDLayoutButton *light;
@property (nonatomic,strong) RDLayoutButton *setting;
@end

NS_ASSUME_NONNULL_END

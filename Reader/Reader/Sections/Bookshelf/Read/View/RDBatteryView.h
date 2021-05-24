//
//  RDBatteryView.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/15.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDBatteryView : UIView
@property (nonatomic,strong) UIColor *batteryColor;
- (void)setBatteryValue:(NSInteger)value;
@end

NS_ASSUME_NONNULL_END

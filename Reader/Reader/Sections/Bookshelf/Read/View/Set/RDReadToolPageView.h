//
//  RDReadToolPageView.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/19.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDReadToolPageView : UIView
@property (nonatomic,assign) RDPageType defaultType;
@property (nonatomic,copy) void(^pageType)(RDPageType type);
@end

NS_ASSUME_NONNULL_END

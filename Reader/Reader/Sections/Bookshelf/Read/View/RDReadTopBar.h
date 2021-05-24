//
//  RDReadTopBar.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/13.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDBookDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol RDReadTopBarDelegate <NSObject>
-(void)backAction;
-(void)downloadAction;
-(void)qusetionAction;
-(void)reloadAction;
@end

@interface RDReadTopBar : UIView
@property (nonatomic,weak) id<RDReadTopBarDelegate>delegate;
//阅读进度
@property (nonatomic,strong) RDBookDetailModel *record;
@end

NS_ASSUME_NONNULL_END

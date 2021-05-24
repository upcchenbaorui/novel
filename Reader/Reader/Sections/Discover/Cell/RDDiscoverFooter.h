//
//  RDDiscoverFooter.h
//  Reader
//
//  Created by 陈保瑞 on 2020/10/29.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RDDiscoverItemModel;
NS_ASSUME_NONNULL_BEGIN

@interface RDDiscoverFooter : UICollectionReusableView
@property (nonatomic,strong) RDDiscoverItemModel *model;
@property (nonatomic,copy) void (^needReload)(RDDiscoverItemModel *);
@property (nonatomic,assign) RDCommPageType pageType;
@end

NS_ASSUME_NONNULL_END

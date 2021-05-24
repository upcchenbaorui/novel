//
//  RDReadProgressView.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/19.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RDCharpterModel;
@class RDBookDetailModel;
NS_ASSUME_NONNULL_BEGIN
@protocol RDReadProgressViewDelegate <NSObject>
-(void)sliderToCharpter:(RDCharpterModel *)charpter;
@end

@interface RDReadProgressView : UIView
//章节总数
@property (nonatomic,strong) NSArray <RDCharpterModel *> *charpters;
//阅读进度
@property (nonatomic,strong) RDBookDetailModel *book;

@property (nonatomic,weak) id<RDReadProgressViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END

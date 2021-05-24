//
//  RDReadCatalogHeader.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/20.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RDReadCatalogHeaderDelegate <NSObject>
-(void)aesedecing;
-(void)descending;
@end

@interface RDReadCatalogHeader : UIView
@property (nonatomic,weak) id<RDReadCatalogHeaderDelegate>delegate;
@property (nonatomic,strong) UILabel *nameLabel;
@end

NS_ASSUME_NONNULL_END

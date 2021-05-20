//
//  RDLoginView.h
//  Reader
//
//  Created by 陈保瑞 on 2021/5/20.
//  Copyright © 2021 LSY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JxbLoginShowType) {
    JxbLoginShowType_NONE,
    JxbLoginShowType_USER,
    JxbLoginShowType_PASS
};

@interface RDLoginView : UIView

@end

NS_ASSUME_NONNULL_END

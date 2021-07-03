//
//  RDSearchController.h
//  Reader
//
//  Created by 陈保瑞 on 2020/2/19.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDSearchController : RDBaseViewController

@property (nonatomic, copy) NSString *searchStr;
@property (nonatomic,strong) NSMutableArray *guess;

@end

NS_ASSUME_NONNULL_END

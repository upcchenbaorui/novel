//
//  RDSpectialFooter.h
//  Reader
//
//  Created by 陈保瑞 on 2020/4/1.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDDiscoverFooter.h"
#import "RDSpecialModel.h"


@interface RDSpectialFooter : RDDiscoverFooter
@property (nonatomic,strong) RDSpecialModel *specialModel;
@property (nonatomic,copy) void (^specialNeedReload)(RDSpecialModel *);
@end


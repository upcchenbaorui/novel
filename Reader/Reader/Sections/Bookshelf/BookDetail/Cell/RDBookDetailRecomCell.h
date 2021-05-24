//
//  RDBookDetailRecomCell.h
//  Reader
//
//  Created by 陈保瑞 on 2020/10/31.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBookDetailBaseCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDBookDetailRecomCell : RDBookDetailBaseCell
@property (nonatomic,copy) void (^needReload)(RDBookDetailModel *);
@end

NS_ASSUME_NONNULL_END

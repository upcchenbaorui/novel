//
//  RDReadDetailApi.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBaseApi.h"
#import "RDBookDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDReadDetailApi : RDBaseApi
@property (nonatomic,assign) NSInteger bookId;
-(RDBookDetailModel *)detailBook;
@end

NS_ASSUME_NONNULL_END

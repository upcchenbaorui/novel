//
//  RDCyharpterContentApi.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/29.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBaseApi.h"
#import "RDCharpterModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDCharpterContentApi : RDBaseApi
@property (nonatomic,assign) NSInteger bookId;
@property (nonatomic,strong) NSArray *charpters;
-(NSArray *)charptersContent;
@end

NS_ASSUME_NONNULL_END

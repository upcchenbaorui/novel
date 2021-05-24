//
//  RDCharpterApi.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/24.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBaseApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDCharpterApi : RDBaseApi
@property (nonatomic,assign) NSInteger bookId;
@property (nonatomic,assign) NSInteger chapterId;
-(NSString *)name;
-(NSString *)author;
-(NSArray *)charpters;

@end

NS_ASSUME_NONNULL_END

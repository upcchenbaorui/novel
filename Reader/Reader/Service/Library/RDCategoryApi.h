//
//  RDCategoryApi.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBaseApi.h"
#import "RDLibraryDetailModel.h"
NS_ASSUME_NONNULL_BEGIN




@interface RDCategoryApi : RDBaseApi
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,assign) NSInteger size;
@property (nonatomic,assign) RDCategoryFilter filter;
@property (nonatomic,assign) NSInteger channelId;
-(NSArray <RDLibraryDetailModel *>*)categories;
@end

NS_ASSUME_NONNULL_END

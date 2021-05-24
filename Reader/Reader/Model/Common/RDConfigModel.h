//
//  RDConfigModel.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDModel.h"

#import "RDCategoryModel.h"
#import "RDBookDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDConfigModel : RDModel
@property (nonatomic,strong) NSArray <RDCategoryModel *>*categories;
@property (nonatomic,strong) NSArray <RDBookDetailModel *>*hotSearch;
@property (nonatomic,strong) NSArray <NSString *> *ports;

+ (instancetype)getModel;
@end

NS_ASSUME_NONNULL_END

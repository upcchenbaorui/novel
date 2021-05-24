//
//  RDCategoryModel.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDCategoryModel : RDModel
//分类名称
@property (nonatomic,strong) NSString *name;
//分类id
@property (nonatomic,assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END

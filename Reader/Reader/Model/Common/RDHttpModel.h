//
//  RDHttpModel.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDHttpModel : RDModel

@property(nonatomic, assign) NSInteger code;
@property(nonatomic, strong) NSString *msg;
@property(nonatomic, strong) NSDictionary *data;

@end

NS_ASSUME_NONNULL_END

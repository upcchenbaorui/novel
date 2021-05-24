//
//  RDShareModel.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/1.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDShareModel : RDModel
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *desc;
@end

NS_ASSUME_NONNULL_END

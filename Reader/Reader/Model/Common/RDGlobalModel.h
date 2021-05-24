//
//  RDGlobalModel.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDGlobalModel : RDModel
DEF_SINGLETON(RDGlobalModel)
@property(nonatomic, strong) NSString *baseUrl;

@property(nonatomic, strong) NSString *picBaseUrl;


- (NSString *)domain;

-(NSString *)prefix;

//切换端口
-(void)changePort;

@end

NS_ASSUME_NONNULL_END

//
//  RDNetWorkManager.h
//  Reader
//
//  Created by 陈保瑞 on 2021/6/19.
//  Copyright © 2021 LSY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDNetWorkManager : NSObject

+ (void)userLogin:(NSString *)userId pwd:(NSString *) pwd completion:(void(^_Nullable)(id model ,  NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END

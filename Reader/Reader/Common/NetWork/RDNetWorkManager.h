//
//  RDNetWorkManager.h
//  Reader
//
//  Created by 陈保瑞 on 2021/6/19.
//  Copyright © 2021 LSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDNetWorkManager : NSObject


+ (void)userUnLogin;

+ (void)userLogin:(NSString *)userId pwd:(NSString *) pwd completion:(void(^_Nullable)(id model ,  NSError * _Nullable error))completion;

+ (void)userRegister:(NSString *)userId pwd:(NSString *)pwd completion:(void(^_Nullable)(id _Nullable model ,  NSError * _Nullable error))completion;

+ (void)userAddBook:(BookInfoModel *)bookInfo completion:(void(^_Nullable)(id model ,  NSError * _Nullable error))completion;

+ (void)reloadBooks;

+ (void)userDeleteBooks:(NSInteger)bookId;

+ (void)userLookBook:(NSString *)category;

+ (void)userLikeBook:(void(^_Nullable)(id model ,  NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END

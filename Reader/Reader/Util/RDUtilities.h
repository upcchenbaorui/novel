//
//  RDUtilities.h
//  Reader
//
//  Created by 陈保瑞 on 2020/12/24.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDUtilities : NSObject
+ (UIViewController *_Nullable)getCurrentVC;

/// 构建静态文件URL
/// @param path 文件路径
+ (NSString *)buildPicUrlWithPath:(NSString *)path;

/// 判断是否是iPAD
+ (BOOL)iPad;
@end

NS_ASSUME_NONNULL_END

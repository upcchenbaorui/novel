//
//  BookInfoModel.h
//  Reader
//
//  Created by 陈保瑞 on 2021/6/27.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookInfoModel : JSONModel

@property (nonatomic, copy) NSString *bookId;
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *userId;

@end

@interface UserInfoModel : JSONModel

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *pwd;

@end

NS_ASSUME_NONNULL_END

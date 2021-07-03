//
//  RegisterModel.h
//  Reader
//
//  Created by 陈保瑞 on 2021/7/2.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "JSONModel.h"
#import "BookInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataModel : JSONModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray<BookInfoModel> *bookInfoList;
@property (nonatomic, strong) UserInfoModel *userInfo;
@property (nonatomic, assign) NSInteger category;

@end

@interface NetworkModel : JSONModel

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) DataModel *data;

@end


NS_ASSUME_NONNULL_END

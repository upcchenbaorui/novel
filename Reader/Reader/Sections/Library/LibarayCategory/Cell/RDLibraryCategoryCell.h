//
// Created by 陈保瑞 on 2020/10/25.
// Copyright (c) 2020 yuenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDLibraryDetailModel.h"
@interface RDLibraryCategoryCell : UITableViewCell
@property (nonatomic,strong) RDLibraryDetailModel *model;

+(CGFloat)categoryCellHeigh:(RDLibraryDetailModel *)model;
@end

//
//  RDBrowerRecordCell.h
//  Reader
//
//  Created by 陈保瑞 on 2021/6/16.
//  Copyright © 2021 LSY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDBookDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDBrowerRecordCell : UITableViewCell

@property (nonatomic,strong) RDBookDetailModel *model;

@end

NS_ASSUME_NONNULL_END

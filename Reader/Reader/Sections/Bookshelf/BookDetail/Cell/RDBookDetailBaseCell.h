//
//  RDBookDetailBaseCell.h
//  Reader
//
//  Created by 陈保瑞 on 2020/10/31.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDBookDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RDBookDetailBaseCell : UITableViewCell
@property (nonatomic,strong) RDBookDetailModel *model;

@end

NS_ASSUME_NONNULL_END

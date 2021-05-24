//
//  RDCommBookCell.h
//  Reader
//
//  Created by 陈保瑞 on 2020/2/26.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RDBookDetailModel;

@interface RDCommBookCell : UITableViewCell
@property (nonatomic,strong) id model;
@property (nonatomic,strong) UIImageView *coverImg;
@end


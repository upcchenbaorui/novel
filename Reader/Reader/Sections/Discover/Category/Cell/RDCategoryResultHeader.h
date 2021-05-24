//
//  RDCategoryResultHeader.h
//  Reader
//
//  Created by 陈保瑞 on 2020/2/28.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RDCategoryResultHeader : UITableViewHeaderFooterView
@property (nonatomic,assign) RDCategoryFilter categoryFilter;
@property (nonatomic,copy) void(^filter)(RDCategoryFilter);
@end


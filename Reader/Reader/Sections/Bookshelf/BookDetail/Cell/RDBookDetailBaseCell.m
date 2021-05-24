//
//  RDBookDetailBaseCell.m
//  Reader
//
//  Created by 陈保瑞 on 2020/10/31.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDBookDetailBaseCell.h"

@implementation RDBookDetailBaseCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


@end

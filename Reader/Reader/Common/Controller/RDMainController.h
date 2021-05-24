//
//  RDMainController.h
//  Reader
//
//  Created by 陈保瑞 on 2020/10/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDVTabBarController.h"

typedef NS_ENUM(NSInteger,RDMainBarItemType){
    RDMainBookShelf = 0,
    RDMainDiscover,
    RDMainLibrary,
    RDMainMe
};

@interface RDMainController : RDVTabBarController <RDVTabBarControllerDelegate>

@end

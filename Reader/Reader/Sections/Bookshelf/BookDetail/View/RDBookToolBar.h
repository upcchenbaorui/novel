//
//  RDBookToolBar.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/5.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RDBookToolBarDelegate <NSObject>

-(void)didAddBook;
-(void)didDownload;
-(void)didBegin;

@end
@interface RDBookToolBar : UIView
@property (nonatomic,weak) id<RDBookToolBarDelegate>delegate;
@property (nonatomic,strong) RDLayoutButton *download;
@property (nonatomic,strong) RDLayoutButton *addBook;
@property (nonatomic,strong) RDLayoutButton *begin;
@end

NS_ASSUME_NONNULL_END

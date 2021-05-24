//
//  RDWebView.m
//  Reader
//
//  Created by 陈保瑞 on 2020/3/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDWebView.h"
#import "RDGlobalModel.h"
#import "GBDeviceInfo.h"
@interface RDWebView ()
@end
@implementation RDWebView

-(instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration
{
    self = [super initWithFrame:frame configuration:configuration];
    if (self) {
        
    }
    return self;
}
-(void)loadReq:(NSURLRequest *)request
{
    [self loadRequest:request];
}



@end

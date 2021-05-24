//
//  RDWebView.h
//  Reader
//
//  Created by 陈保瑞 on 2020/3/23.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface RDWebView : WKWebView

-(void)loadReq:(NSURLRequest *)request;

@end


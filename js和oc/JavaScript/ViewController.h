//
//  ViewController.h
//  JavaScript
//
//  Created by 姜鸿儒 on 17/4/19.
//  Copyright © 2016年 厦门乙科网络公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <MessageUI/MessageUI.h>
@protocol JSObjcDelegate <JSExport>
- (void)call;
- (void)getCall:(NSString *)callString;
- (void)postCall:(NSString *)callString;
@end
@interface ViewController : UIViewController<UIWebViewDelegate,JSObjcDelegate>
@property (nonatomic, strong) JSContext *jsContext;
@property (strong, nonatomic)  UIWebView *webView;
@property(nonatomic, weak)id<MFMessageComposeViewControllerDelegate>delegate;
@end


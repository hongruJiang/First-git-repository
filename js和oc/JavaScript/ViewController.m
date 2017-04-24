//
//  ViewController.m
//  JavaScript
//
//  Created by 姜鸿儒 on 17/4/19.
//  Copyright © 2016年 厦门乙科网络公司. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end
        BOOL bo=YES;
@implementation ViewController

#pragma mark - 代理方法
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultSent:
        //信息传送成功
        
        break;
        case MessageComposeResultFailed:
        //信息传送失败
        
        break;
        case MessageComposeResultCancelled:
        //信息被用户取消传送
        
        break;
        default:
        break;
    }
}
#pragma mark - 发送短信方法
-(void)showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body
{
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
        controller.recipients = phones;
        controller.navigationBar.tintColor = [UIColor redColor];
        controller.body = body;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];//修改短信界面标题
    }
    else
    {
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar
}
-(void)viewWillAppear:(BOOL)animated{
    UIImage *image = [[UIImage alloc]init];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
-(void)viewDidAppear:(BOOL)animated{

    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.webView.delegate = self;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(40, 480, 40, 40);
    [btn1 addTarget:self action:@selector(buttonAction1)forControlEvents:UIControlEventTouchUpInside];
    [self.webView addSubview:btn1];
    
    UITextField *accountField = [[UITextField alloc] initWithFrame:CGRectMake(90, 25, 150, 30)];
    [accountField setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    accountField.placeholder = @"     输入检索信息"; //默认显示的字
    [accountField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    accountField.secureTextEntry = NO; //是否以密码形式显示
//    [accountField setBackgroundColor:[UIColor clearColor]];//透明效果
    [self.webView addSubview:accountField];
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [img setImage:[UIImage imageNamed:@"456"]];
    [accountField addSubview:img];
    

    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"tianbai"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
}


//- (void)call{
//    // 之后在回调js的方法Callback把内容传出去
//    JSValue *Callback = self.jsContext[@"Callback"];
//    //传值给web端
//    [Callback callWithArguments:@[@"唤起本地OC回调完成"]];
//}
//- (void)test{
//    // 之后在回调js的方法Callback把内容传出去
//    JSValue *Callback = self.jsContext[@"Callback"];
//    //传值给web端
//    [Callback callWithArguments:@[@"唤起本地OC回调完成"]];
//}
-(void)buttonAction1{
//    NSLog(@"%f",self.view.bounds.size.width);
}

- (void)getCall:(NSString *)callString{
   
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",callString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    NSLog(@"Get:%@", callString);
    
//    // 成功回调js的方法Callback
//    JSValue *Callback = self.jsContext[@"alerCallback"];
//    [Callback callWithArguments:nil];
//    直接添加提示框
//    NSString *str = @"alert('OC添加JS提示成功')";
//    [self.jsContext evaluateScript:str];
   
}
- (void)postCall:(NSString *)callString{
    
        NSMutableString *str1=[[NSMutableString alloc] initWithFormat:@"tel:%@",callString];
        [self showMessageView:[NSArray arrayWithObjects:str1, nil] title:@"test" body:@"这是测试用短信，勿回复！"];
        NSLog(@"post:%@", callString);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

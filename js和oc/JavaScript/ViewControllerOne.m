//
//  ViewControllerOne.m
//  JavaScript
//
//  Created by 姜鸿儒 on 17/4/19.
//  Copyright © 2017年 厦门乙科网络公司. All rights reserved.
//

#import "ViewControllerOne.h"
#import "ViewController.h"
#import <MessageUI/MessageUI.h>
@interface ViewControllerOne ()

@end

@implementation ViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor yellowColor];
    btn.frame = CGRectMake(90, 90, 51, 24);
    [btn addTarget:self action:@selector(buttonAction)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (void)buttonAction{
    ViewController *view1=[[ViewController alloc]init];
    [self.navigationController pushViewController:view1 animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

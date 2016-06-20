//
//  XDSecondController.m
//  滚动视图
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 xiaodai. All rights reserved.
//

#import "XDSecondController.h"

@interface XDSecondController ()

@end

@implementation XDSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200) / 2, (self.view.frame.size.height - 80) / 2, 200, 80)];
    label.text = @"Second";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:60.0];
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

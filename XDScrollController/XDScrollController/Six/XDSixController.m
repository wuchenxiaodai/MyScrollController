//
//  XDSixController.m
//  滚动视图
//
//  Created by Mac on 16/6/4.
//  Copyright © 2016年 xiaodai. All rights reserved.
//

#import "XDSixController.h"

@interface XDSixController ()

@end

@implementation XDSixController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor magentaColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200) / 2, (self.view.frame.size.height - 80) / 2, 200, 80)];
    label.text = @"Six";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:60.0];
    
    [self.view addSubview:label];
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

//
//  XDTabBarController.m
//  滚动视图
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 xiaodai. All rights reserved.
//

#import "XDTabBarController.h"
#import "XDFirstController.h"
#import "XDSecondController.h"
#import "XDThreeController.h"
#import "XDFourController.h"
#import "XDFiveController.h"
#import "XDSixController.h"
#import "XDSevenController.h"
#import "XDEightController.h"
#import "XDNineController.h"

#import "XDContainerController.h"

@interface XDTabBarController ()

@end

@implementation XDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.viewControllers = [self createViewControllers];
    
}

- (NSArray *)createViewControllers
{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    
    /************************首页控制器**************************/
    NSArray *titles = @[@"第一",@"第二",@"第三", @"第四", @"第五", @"第六", @"第七", @"第八"];
    NSArray *classes = @[@"XDFirstController", @"XDSecondController", @"XDThreeController", @"XDFourController", @"XDFiveController", @"XDSixController", @"XDSevenController", @"XDEightController"];
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < classes.count; i++) {
        Class cla = NSClassFromString(classes[i]);
        
        UIViewController *vc = [[cla alloc] init];
        
        UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:vc];
        
        vc.title = titles[i];
        
        [mutableArray addObject:na];
    }
    
    XDContainerController *containController = [[XDContainerController alloc] init];
    
    containController.viewControlles = mutableArray;
    containController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"Function_main.png"] selectedImage:[UIImage imageNamed:@"main_select.png"]];
    
    [arr addObject:containController];
    
    /************************娱乐控制器**************************/
    NSArray *titles1 = @[@"第二",@"第三", @"第四", @"第五", @"第六", @"第七", @"第八"];
    NSArray *classes1 = @[@"XDSecondController", @"XDThreeController", @"XDFourController", @"XDFiveController", @"XDSixController", @"XDSevenController", @"XDEightController"];
    
    NSMutableArray *mutableArray1 = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < classes1.count; i++) {
        Class cla1 = NSClassFromString(classes1[i]);
        
        UIViewController *vc1 = [[cla1 alloc] init];
        
        UINavigationController *na1 = [[UINavigationController alloc] initWithRootViewController:vc1];
        
        vc1.title = titles1[i];
        
        [mutableArray1 addObject:na1];
    }
    
    XDContainerController *containController1 = [[XDContainerController alloc] init];
    
    containController1.viewControlles = mutableArray1;
    containController1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"娱乐" image:[UIImage imageNamed:@"tabbar_limitfree.png"] selectedImage:[UIImage imageNamed:@"tabbar_limitfree_press.png"]];
    
    
    [arr addObject:containController1];
    
    
    /**********************个人中心控制器************************/
    
    UIViewController *vc2 = [[XDNineController alloc] init];

    UINavigationController *na2 = [[UINavigationController alloc] initWithRootViewController:vc2];

    na2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人中心" image:[UIImage imageNamed:@"tabbar_setting@2x.png"] selectedImage:[UIImage imageNamed:@"tabbar_setting_hl@2x.png"]];

    [arr addObject:na2];
    
    /************************************************************/
    
    return arr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

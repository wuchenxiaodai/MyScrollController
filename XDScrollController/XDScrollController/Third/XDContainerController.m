//
//  XDContainerController.m
//  滚动视图
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 xiaodai. All rights reserved.
//

#import "XDContainerController.h"
#import "XDTopBarScrollView.h"

@interface XDContainerController () <UIScrollViewDelegate, XDTopBarScrollViewDelegate>

//创建UIScrollView
@property (nonatomic, strong) UIScrollView *scrollView;
//当前页数
@property (nonatomic, assign) NSInteger currentPage;
//设置顶部的滚动按钮
@property (nonatomic, strong) XDTopBarScrollView *topBarScroll;

@end

@implementation XDContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

//懒加载
- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topBarScroll.frame), self.view.frame.size.width, self.view.frame.size.height - 35)];
        _scrollView.backgroundColor = [UIColor purpleColor];
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        //控制控件遇到边框是否反弹
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        
        [self.view addSubview:_scrollView];
    }
    
    return _scrollView;
}

//懒加载
- (XDTopBarScrollView *)topBarScroll
{
    CGFloat x = 0.0;
    
    if (_topBarScroll == nil) {
        _topBarScroll = [[XDTopBarScrollView alloc] initWithFrame:CGRectMake(x, [[UIApplication sharedApplication] statusBarFrame].size.height, CGRectGetWidth(self.view.frame), 35)];
        //设置代理传值
        _topBarScroll.delegateTopBar = self;
        
        _topBarScroll.backgroundColor = [UIColor orangeColor];
        
        [self.view addSubview:_topBarScroll];
    }
    
    return _topBarScroll;
}

//重写加载视图控制器
- (void)setViewControlles:(NSArray *)viewControlles
{
    _viewControlles = [NSArray arrayWithArray:viewControlles];
    
    CGFloat x = 0.0;
    
    for(UIViewController *viewController in _viewControlles){
        
        //当一个控制器添加到从视图控制器容器中被添加之前
        [viewController willMoveToParentViewController:self];
        viewController.view.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:viewController.view];
        //当一个控制器添加到从视图控制器被添加之后
        [viewController didMoveToParentViewController:self];
        
        x += CGRectGetWidth(self.scrollView.frame);
        
        self.scrollView.contentSize = CGSizeMake(x, self.scrollView.frame.size.height);
    }
    
    self.topBarScroll.titles = [_viewControlles valueForKey:@"title"];
}

//当前的页数CurrentPage <delegate>
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger currentPage = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.topBarScroll.currentPage = currentPage;
    self.currentPage = currentPage;
}
// 通过代理传值 《XDTopBarScrollViewDelegate》
- (void)clickedButtonToCurrentPage:(NSInteger)currentPage
{
    self.currentPage = currentPage;
}

//设置当前页
- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    [_scrollView setContentOffset:CGPointMake(currentPage * self.scrollView.frame.size.width, 0) animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  XDTopBarScrollView.m
//  滚动视图
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 xiaodai. All rights reserved.
//

#import "XDTopBarScrollView.h"

@interface XDTopBarScrollView ()

//创建按钮，有多少个标题就有多少个按钮
@property (nonatomic, strong) NSMutableArray *buttons;
//创建一个按钮下的滑动view
@property (nonatomic, strong) UIView *slidView;

@end

@implementation XDTopBarScrollView

@synthesize titles = _titles;

- (NSMutableArray *)titles
{
    if (_titles == nil) {
        _titles = [NSMutableArray array];
    }
    
    return _titles;
}

//创建可变数组添加标题
- (void)setTitles:(NSMutableArray *)titles
{
    self.showsHorizontalScrollIndicator = NO;
    
    self.buttons = [[NSMutableArray alloc] initWithCapacity:0];
    
    _titles = titles;
    
    CGFloat x = 0.0;
    CGFloat space = 20.0;
    
    for (int i = 0; i < titles.count; i++) {
        
        if ([_titles[i] isKindOfClass:[NSNull class]]) {
            continue;//判断是否为空
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //设置该属性让按钮的大小随着字体的大小而改变
        button.frame = CGRectMake(x + 20, 0, button.intrinsicContentSize.width, 35);
        [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        
        x += button.intrinsicContentSize.width + 40;

        [self addSubview:button];
        
        [self.buttons addObject:button];
    }
    
    self.contentSize = CGSizeMake(CGRectGetMaxX([self.buttons.lastObject frame]) + space, CGRectGetHeight(self.frame));
    
    UIButton *firstButton = [self.buttons firstObject];
    
    CGRect frame = firstButton.frame;
    
    self.slidView = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, CGRectGetMaxY(frame) - 5, CGRectGetWidth(frame), 5)];
    self.slidView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.slidView];
}

//点击按钮事件
- (void)clickedButton:(UIButton *)button
{
    self.currentPage = [self.buttons indexOfObject:button];
    
    [_delegateTopBar clickedButtonToCurrentPage:self.currentPage];
}

//标题的页数
- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    
    UIButton *button = [self.buttons objectAtIndex:_currentPage];
    CGRect frame = button.frame;
    frame.origin.x -= 20;
    frame.size.width += 50;
    
    [self scrollRectToVisible:frame animated:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.slidView.frame = CGRectMake(button.frame.origin.x, CGRectGetMaxY(frame) - 5, button.intrinsicContentSize.width, 5);
    } completion:^(BOOL finished) {
        //
    }];
    
}

@end

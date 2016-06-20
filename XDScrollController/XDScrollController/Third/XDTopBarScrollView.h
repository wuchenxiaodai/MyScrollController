//
//  XDTopBarScrollView.h
//  滚动视图
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 xiaodai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XDTopBarScrollViewDelegate <NSObject>

@required
//通过该协议进行传值
- (void)clickedButtonToCurrentPage:(NSInteger)currentPage;

@end

@interface XDTopBarScrollView : UIScrollView

//创建一个标题是可变数组
@property (nonatomic, strong) NSMutableArray *titles;
//标题的页数
@property (nonatomic, assign) NSInteger currentPage;
//设置代理
@property (nonatomic, weak) id <XDTopBarScrollViewDelegate> delegateTopBar;

@end

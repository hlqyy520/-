//
//  HQTabBar.h
//  HQWeibo
//
//  Created by apple on 15-2-5.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQTabBar;

@protocol HQTabBarDelegate <NSObject>

@optional
- (void)tabBar:(HQTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
- (void)tabBarDidClickedPlusButton:(HQTabBar *)tabBar;

@end

@interface HQTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<HQTabBarDelegate> delegate;

@end

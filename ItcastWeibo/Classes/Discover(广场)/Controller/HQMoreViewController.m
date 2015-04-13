//
//  HQMoreViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQMoreViewController.h"
#import "HQSettingArrowItem.h"
#import "HQSettingGroup.h"

@interface HQMoreViewController ()

@end

@implementation HQMoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *shop = [HQSettingArrowItem itemWithIcon:@"shop" title:@"精选商品" destVcClass:nil];
    HQSettingArrowItem *lottery = [HQSettingArrowItem itemWithIcon:@"lottery" title:@"彩票" destVcClass:nil];
    HQSettingArrowItem *food = [HQSettingArrowItem itemWithIcon:@"food" title:@"美食" destVcClass:nil];
    HQSettingArrowItem *car = [HQSettingArrowItem itemWithIcon:@"car" title:@"汽车" destVcClass:nil];
    HQSettingArrowItem *tour = [HQSettingArrowItem itemWithIcon:@"tour" title:@"旅游" destVcClass:nil];
    HQSettingArrowItem *news = [HQSettingArrowItem itemWithIcon:@"news" title:@"新浪新闻" destVcClass:nil];
    HQSettingArrowItem *recommend = [HQSettingArrowItem itemWithIcon:@"recommend" title:@"官方推荐" destVcClass:nil];
    HQSettingArrowItem *read = [HQSettingArrowItem itemWithIcon:@"read" title:@"读书" destVcClass:nil];
    
    group.items = @[shop, lottery, food, car, tour, news, recommend, read];
}

@end

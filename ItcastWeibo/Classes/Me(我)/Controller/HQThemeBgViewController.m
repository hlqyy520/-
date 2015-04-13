//
//  HQThemeBgViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQThemeBgViewController.h"
#import "HQSettingArrowItem.h"
#import "HQSettingGroup.h"

@interface HQThemeBgViewController ()

@end

@implementation HQThemeBgViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
    [self setupGroup1];
}

- (void)setupGroup0
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *theme = [HQSettingArrowItem itemWithTitle:@"主题"];
    group.items = @[theme];
}

- (void)setupGroup1
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *bg = [HQSettingArrowItem itemWithTitle:@"背景"];
    group.items = @[bg];
}

@end

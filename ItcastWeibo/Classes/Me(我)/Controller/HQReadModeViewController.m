//
//  HQReadModeViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQReadModeViewController.h"
#import "HQSettingCheckItem.h"
#import "HQSettingSwitchItem.h"
#import "HQSettingLabelItem.h"
#import "HQSettingCheckGroup.h"

@interface HQReadModeViewController ()

@end

@implementation HQReadModeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
    [self setupGroup1];
}

- (void)setupGroup0
{
    // 添加组
    HQSettingCheckGroup *group = [HQSettingCheckGroup group];
    [self.groups addObject:group];
    
    // 设置数据
    HQSettingCheckItem *with = [HQSettingCheckItem itemWithTitle:@"有图模式"];
    HQSettingCheckItem *without = [HQSettingCheckItem itemWithTitle:@"无图模式"];
    group.items = @[with, without];
    
    // 设置来源
    group.sourceItem = self.sourceItem;
}

- (void)setupGroup1
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingSwitchItem *show = [HQSettingSwitchItem itemWithTitle:@"显示缩略微博"];
    
    group.items = @[show];
}
@end

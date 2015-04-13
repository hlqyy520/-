//
//  HQGeneralViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQGeneralViewController.h"
#import "HQSettingArrowItem.h"
#import "HQSettingSwitchItem.h"
#import "HQSettingLabelItem.h"
#import "HQSettingGroup.h"
#import "HQReadModeViewController.h"
#import "HQFontViewController.h"
#import "HQLanguageViewController.h"
#import "HQIconQualityViewController.h"

@interface HQGeneralViewController ()

@end

@implementation HQGeneralViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    [self setupGroup4];
}

- (void)setupGroup0
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingLabelItem *read = [HQSettingLabelItem itemWithTitle:@"阅读模式" destVcClass:[HQReadModeViewController class]];
    read.defaultText = @"有图模式";
    read.readyForDestVc = ^(HQSettingLabelItem *item, HQReadModeViewController *destVc){
        destVc.sourceItem = item;
    };
    
    HQSettingLabelItem *font = [HQSettingLabelItem itemWithTitle:@"字号大小" destVcClass:[HQFontViewController class]];
    font.defaultText = @"中";
    font.readyForDestVc = ^(HQSettingLabelItem *item, HQFontViewController *destVc){
        destVc.sourceItem = item;
    };
    
    HQSettingSwitchItem *mark = [HQSettingSwitchItem itemWithTitle:@"显示备注"];
    
    group.items = @[read, font, mark];
}

- (void)setupGroup1
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *picture = [HQSettingArrowItem itemWithTitle:@"图片质量设置" destVcClass:[HQIconQualityViewController class]];
    group.items = @[picture];
}

- (void)setupGroup2
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingSwitchItem *voice = [HQSettingSwitchItem itemWithTitle:@"声音"];
    group.items = @[voice];
}

- (void)setupGroup3
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingLabelItem *language = [HQSettingLabelItem itemWithTitle:@"多语言环境" destVcClass:[HQLanguageViewController class]];
    language.defaultText = @"跟随系统";
    language.readyForDestVc = ^(HQSettingLabelItem *item, HQLanguageViewController *destVc){
        destVc.sourceItem = item;
    };
    group.items = @[language];
}

- (void)setupGroup4
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *clearCache = [HQSettingArrowItem itemWithTitle:@"清除图片缓存"];
    HQSettingArrowItem *clearHistory = [HQSettingArrowItem itemWithTitle:@"清空搜索历史"];
    group.items = @[clearCache, clearHistory];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

@end

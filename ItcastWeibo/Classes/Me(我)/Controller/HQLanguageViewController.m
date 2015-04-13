//
//  HQLanguageViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQLanguageViewController.h"
#import "HQSettingCheckItem.h"
#import "HQSettingCheckGroup.h"
#import "HQSettingLabelItem.h"

@interface HQLanguageViewController ()

@end

@implementation HQLanguageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加组
    HQSettingCheckGroup *group = [HQSettingCheckGroup group];
    [self.groups addObject:group];
    
    // 设置数据
    HQSettingCheckItem *sys = [HQSettingCheckItem itemWithTitle:@"跟随系统"];
    HQSettingCheckItem *simple = [HQSettingCheckItem itemWithTitle:@"简体中文"];
    HQSettingCheckItem *complex = [HQSettingCheckItem itemWithTitle:@"繁體中文"];
    HQSettingCheckItem *english = [HQSettingCheckItem itemWithTitle:@"English"];
    group.items = @[sys, simple, complex, english];
    
    // 设置来源
    group.sourceItem = self.sourceItem;
}

@end

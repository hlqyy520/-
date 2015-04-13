//
//  HQIconQualityViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQIconQualityViewController.h"
#import "HQSettingLabelItem.h"
#import "HQSettingCheckItem.h"
#import "HQSettingCheckGroup.h"

@interface HQIconQualityViewController ()

@end

@implementation HQIconQualityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
    [self setupGroup1];
}

- (void)setupGroupWithHeader:(NSString *)header
{
    // 添加组
    HQSettingCheckGroup *group = [HQSettingCheckGroup group];
    group.header = header;
    [self.groups addObject:group];
    
    // 设置数据
    HQSettingCheckItem *high = [HQSettingCheckItem itemWithTitle:@"高清"];
    high.subtitle = @"(建议在wifi或3G网络使用)";
    HQSettingCheckItem *normal = [HQSettingCheckItem itemWithTitle:@"普通"];
    normal.subtitle = @"(上传速度快，省流量)";
    group.items = @[high, normal];
    
    HQSettingLabelItem *item = [HQSettingLabelItem item];
    item.key = group.header;
    item.defaultText = high.title;
    group.sourceItem = item;
}

- (void)setupGroup0
{
    [self setupGroupWithHeader:@"上传图片质量"];
}

- (void)setupGroup1
{
    [self setupGroupWithHeader:@"下载图片质量"];
}

@end

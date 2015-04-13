//
//  HQFontViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQFontViewController.h"
#import "HQSettingCheckItem.h"
#import "HQSettingCheckGroup.h"
#import "HQSettingLabelItem.h"

@interface HQFontViewController ()
@end

@implementation HQFontViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加组
    HQSettingCheckGroup *group = [HQSettingCheckGroup group];
    [self.groups addObject:group];
    
    // 设置数据
    HQSettingCheckItem *big = [HQSettingCheckItem itemWithTitle:@"大"];
    HQSettingCheckItem *middle = [HQSettingCheckItem itemWithTitle:@"中"];
    HQSettingCheckItem *small = [HQSettingCheckItem itemWithTitle:@"小"];
    group.items = @[big, middle, small];
    
    // 设置来源
    group.sourceItem = self.sourceItem;
}


@end

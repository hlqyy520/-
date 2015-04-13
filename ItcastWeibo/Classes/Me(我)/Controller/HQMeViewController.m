//
//  HQMeViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-3.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQMeViewController.h"
#import "HQSettingArrowItem.h"
#import "HQSettingGroup.h"
#import "HQSystemSettingViewController.h"

@interface HQMeViewController ()

@end

@implementation HQMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(setting)];
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}

/**
 *  设置
 */
- (void)setting
{
    HQSystemSettingViewController *sys = [[HQSystemSettingViewController alloc] init];
    [self.navigationController pushViewController:sys animated:YES];
}

- (void)setupGroup0
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *newFriend = [HQSettingArrowItem itemWithIcon:@"new_friend" title:@"新的好友" destVcClass:nil];
    newFriend.badgeValue = @"4";
    group.items = @[newFriend];
}

- (void)setupGroup1
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *album = [HQSettingArrowItem itemWithIcon:@"album" title:@"我的相册" destVcClass:nil];
    album.subtitle = @"(109)";
    HQSettingArrowItem *collect = [HQSettingArrowItem itemWithIcon:@"collect" title:@"我的收藏" destVcClass:nil];
    collect.subtitle = @"(0)";
    HQSettingArrowItem *like = [HQSettingArrowItem itemWithIcon:@"like" title:@"赞" destVcClass:nil];
    like.badgeValue = @"1";
    like.subtitle = @"(35)";
    group.items = @[album, collect, like];
}

- (void)setupGroup2
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *pay = [HQSettingArrowItem itemWithIcon:@"pay" title:@"微博支付" destVcClass:nil];
    HQSettingArrowItem *vip = [HQSettingArrowItem itemWithIcon:@"vip" title:@"会员中心" destVcClass:nil];
    group.items = @[pay, vip];
}

- (void)setupGroup3
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *card = [HQSettingArrowItem itemWithIcon:@"card" title:@"我的名片" destVcClass:nil];
    HQSettingArrowItem *draft = [HQSettingArrowItem itemWithIcon:@"draft" title:@"草稿箱" destVcClass:nil];
    group.items = @[card, draft];
}

@end
//
//  HQDiscoverViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-3.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQDiscoverViewController.h"
#import "HQSearchBar.h"
#import "HQSettingArrowItem.h"
#import "HQSettingGroup.h"
#import "HQMoreViewController.h"
#import "HQDiscoverHeaderView.h"

@interface HQDiscoverViewController ()

@end

@implementation HQDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加搜索框
    HQSearchBar *search = [[HQSearchBar alloc] init];
    search.bounds = CGRectMake(0, 0, 305, 30);
    self.navigationItem.titleView = search;
    
    // 2.header
    self.tableView.tableHeaderView = [HQDiscoverHeaderView headerView];
    if (iOS7) {
        self.tableView.contentInset = UIEdgeInsetsZero;
    }
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}

- (void)setupGroup0
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *hot = [HQSettingArrowItem itemWithIcon:@"hot_status" title:@"热门微博" destVcClass:nil];
    hot.subtitle = @"笑话，娱乐，神最右都搬到这啦";
    
    HQSettingArrowItem *find = [HQSettingArrowItem itemWithIcon:@"find_people" title:@"找人" destVcClass:nil];
    find.subtitle = @"名人、有意思的人尽在这里";
    
    group.items = @[hot, find];
}

- (void)setupGroup1
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *gameCenter = [HQSettingArrowItem itemWithIcon:@"game_center" title:@"游戏中心" destVcClass:nil];
    HQSettingArrowItem *near = [HQSettingArrowItem itemWithIcon:@"near" title:@"周边" destVcClass:nil];
    HQSettingArrowItem *app = [HQSettingArrowItem itemWithIcon:@"app" title:@"应用" destVcClass:nil];
    group.items = @[gameCenter, near, app];
}

- (void)setupGroup2
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *video = [HQSettingArrowItem itemWithIcon:@"video" title:@"视频" destVcClass:nil];
    HQSettingArrowItem *music = [HQSettingArrowItem itemWithIcon:@"music" title:@"音乐" destVcClass:nil];
    HQSettingArrowItem *movie = [HQSettingArrowItem itemWithIcon:@"movie" title:@"电影" destVcClass:nil];
    HQSettingArrowItem *cast = [HQSettingArrowItem itemWithIcon:@"cast" title:@"播客" destVcClass:nil];
    HQSettingArrowItem *more = [HQSettingArrowItem itemWithIcon:@"more" title:@"更多" destVcClass:[HQMoreViewController class]];
    
    group.items = @[video, music, movie, cast, more];
}

#pragma mark - 代理
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view.window endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view.window endEditing:YES];
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end

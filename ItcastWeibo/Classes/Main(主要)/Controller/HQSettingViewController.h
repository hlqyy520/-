//
//  HQSettingViewController.h
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import <UIKit/UIKit.h>
@class HQSettingGroup;

@interface HQSettingViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *groups;

- (HQSettingGroup *)addGroup;
@end

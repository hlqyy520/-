//
//  HQStatusCell.h
//  HQWeibo
//
//  Created by apple on 15-1-9.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//  展示微博的cell

#import <UIKit/UIKit.h>
@class HQStatusFrame;
@interface HQStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) HQStatusFrame *statusFrame;
@end

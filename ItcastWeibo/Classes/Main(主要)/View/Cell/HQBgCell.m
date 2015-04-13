//
//  HQBgCell.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQBgCell.h"

@implementation HQBgCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *bg = [[UIImageView alloc] init];
        self.backgroundView = bg;
        self.bg = bg;
        
        UIImageView *selectedBg = [[UIImageView alloc] init];
        self.selectedBackgroundView = selectedBg;
        self.selectedBg = selectedBg;
    }
    return self;
}

@end

//
//  HQReweetStatusView.m
//  HQWeibo
//
//  Created by apple on 15-1-11.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQReweetStatusView.h"
#import "HQStatus.h"
#import "HQUser.h"
#import "HQStatusFrame.h"
#import "HQPhoto.h"
#import "UIImageView+WebCache.h"
#import "HQPhotosView.h"

@interface HQReweetStatusView()
/** 被转发微博作者的昵称 */
@property (nonatomic, weak) UILabel *retweetNameLabel;
/** 被转发微博的正文\内容 */
@property (nonatomic, weak) UILabel *retweetContentLabel;
/** 被转发微博的配图 */
@property (nonatomic, weak) HQPhotosView *retweetPhotosView;
@end

@implementation HQReweetStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置图片
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_retweet_background" left:0.9 top:0.5];
        
        /** 2.被转发微博作者的昵称 */
        UILabel *retweetNameLabel = [[UILabel alloc] init];
        retweetNameLabel.font = HQRetweetStatusNameFont;
        retweetNameLabel.textColor = HQColor(67, 107, 163);
        retweetNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:retweetNameLabel];
        self.retweetNameLabel = retweetNameLabel;
        
        /** 3.被转发微博的正文\内容 */
        UILabel *retweetContentLabel = [[UILabel alloc] init];
        retweetContentLabel.font = HQRetweetStatusContentFont;
        retweetContentLabel.backgroundColor = [UIColor clearColor];
        retweetContentLabel.numberOfLines = 0;
        retweetContentLabel.textColor = HQColor(90, 90, 90);
        [self addSubview:retweetContentLabel];
        self.retweetContentLabel = retweetContentLabel;
        
        /** 4.被转发微博的配图 */
        HQPhotosView *retweetPhotosView = [[HQPhotosView alloc] init];
        [self addSubview:retweetPhotosView];
        self.retweetPhotosView = retweetPhotosView;
    }
    return self;
}

- (void)setStatusFrame:(HQStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    HQStatus *retweetStatus = statusFrame.status.retweeted_status;
    HQUser *user = retweetStatus.user;
    
    // 1.昵称
    self.retweetNameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    self.retweetNameLabel.frame = self.statusFrame.retweetNameLabelF;
    
    // 2.正文
    self.retweetContentLabel.text = retweetStatus.text;
    self.retweetContentLabel.frame = self.statusFrame.retweetContentLabelF;
    
    // 3.配图
    if (retweetStatus.pic_urls.count) {
        self.retweetPhotosView.hidden = NO;
        self.retweetPhotosView.frame = self.statusFrame.retweetPhotosViewF;
        self.retweetPhotosView.photos = retweetStatus.pic_urls;
    } else {
        self.retweetPhotosView.hidden = YES;
    }
}

@end

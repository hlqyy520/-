//
//  HQComposeToolbar.h
//  HQWeibo
//
//  Created by MJ Lee on 15-2-18.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HQComposeToolbarButtonTypeCamera,
    HQComposeToolbarButtonTypePicture,
    HQComposeToolbarButtonTypeMention,
    HQComposeToolbarButtonTypeTrend,
    HQComposeToolbarButtonTypeEmotion
} HQComposeToolbarButtonType;

@class HQComposeToolbar;

@protocol HQComposeToolbarDelegate <NSObject>
@optional
- (void)composeToolbar:(HQComposeToolbar *)toolbar didClickedButton:(HQComposeToolbarButtonType)buttonType;
@end

@interface HQComposeToolbar : UIView
@property (weak, nonatomic) id<HQComposeToolbarDelegate> delegate;
@end

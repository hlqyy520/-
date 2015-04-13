//
//  HQPlaceholderTextView.h
//  HQWeibo
//
//  Created by mj on 14-1-11.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//  有占位文字的TextView

#import <UIKit/UIKit.h>

@interface HQPlaceholderTextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) UIColor *placeholderColor;
@end

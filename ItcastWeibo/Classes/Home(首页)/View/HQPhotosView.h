//
//  HQPhotosView.h
//  HQWeibo
//
//  Created by apple on 15-2-11.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HQPhotosView : UIView
/**
 *  需要展示的图片(数组里面装的都是HQPhoto模型)
 */
@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片的个数返回相册的最终尺寸
 */
+ (CGSize)photosViewSizeWithPhotosCount:(int)count;
@end

//
//  IWHomeStatusesResult.m
//  ItcastWeibo
//
//  Created by apple on 14-5-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWHomeStatusesResult.h"
#import "MJExtension.h"
#import "HQStatus.h"

@implementation IWHomeStatusesResult
- (NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [HQStatus class]};
}
@end

//
//  HQAccountTool.m
//  HQWeibo
//
//  Created by apple on 15-1-8.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQAccount.h"
#import "HQAccountTool.h"

#define HQAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation HQAccountTool
+ (void)saveAccount:(HQAccount *)account
{
    // 计算账号的过期时间
    NSDate *now = [NSDate date];
    account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];
    
    [NSKeyedArchiver archiveRootObject:account toFile:HQAccountFile];
}

+ (HQAccount *)account
{
    // 取出账号
    HQAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:HQAccountFile];
    
    // 判断账号是否过期
    NSDate *now = [NSDate date];
    if ([now compare:account.expiresTime] == NSOrderedAscending) { // 还没有过期
        return account;
    } else { // 过期
        return nil;
    }
}
@end

//
//  UserDefaultsUtility.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <Foundation/Foundation.h>

/** key:是否是第一次安装app*/
static NSString * const YNUserDefaultsIsFirstInstallAppKey = @"IsFirstInstallApp";


@interface UserDefaultsUtility : NSObject

/**
 设置NSUserDefaults
 */
+ (id)valueWithKeyName:(NSString *)keyName;

+ (BOOL)boolValueWithKeyName:(NSString *)keyName;

+ (void)modifyWithKeyName:(NSString *)keyName newBoolValue:(BOOL)newValue;

+ (void)modifyWithKeyName:(NSString *)keyName newStringValue:(NSString *)newValue;

+ (void)modifyWithKeyName:(NSString *)keyName newIntegerValue:(NSInteger)newValue;

@end

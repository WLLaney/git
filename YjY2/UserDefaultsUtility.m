//
//  UserDefaultsUtility.m
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "UserDefaultsUtility.h"

@implementation UserDefaultsUtility

+ (id)valueWithKeyName:(NSString *)keyName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults valueForKey:keyName];
}

+ (BOOL)boolValueWithKeyName:(NSString *)keyName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:keyName];
}

+ (void)modifyWithKeyName:(NSString *)keyName newBoolValue:(BOOL)newValue
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:newValue forKey:keyName];
}

+ (void)modifyWithKeyName:(NSString *)keyName newIntegerValue:(NSInteger)newValue
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:newValue forKey:keyName];
}

+ (void)modifyWithKeyName:(NSString *)keyName newStringValue:(NSString *)newValue
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:newValue forKey:keyName];
}

@end

//
//  UserDefaultsUtility+YjYLoginUser.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "UserDefaultsUtility.h"

/** 当前用户登录状态*/
typedef NS_ENUM(NSInteger, UserDefaultsLoginStatus){
    /** 注销账户或未登录*/
    YNUserDefaultsLoginStatusOFF = 0,
    /** 已登录过或免登录*/
    YNUserDefaultsLoginStatusON = 1
};

/** 第一次使用app状态标记,按如下顺序判断*/
typedef NS_ENUM(NSInteger, UserDefaultsAppFinishedStatus){
    /** 初始状态*/
    YNUserDefaultsAppFinishedStatusFirstNone = 0,
    /** 已完成第一次导航*/
    YNUserDefaultsAppFinishedStatusFirstGuide = 2,
    /** 已完成第一次登录*/
    YNUserDefaultsAppFinishedStatusFirstLogin = 1,
    /** 第一次已结束*/
    YNUserDefaultAppFinishedStatusFisrtCompleted = 3
};

//用户账户ID
static NSString * const UserDefaultsAccountIDKey = @"U_IDdb";

//用户头像
static NSString * const UserDefaultsAvatarKey=@"U_avatar";

//用户昵称
static NSString * const UserDefaultsNameKey=@"U_name";

//用户性别
static NSString * const UserDefaultsSexKey=@"U_sex";

//用户生日
static NSString * const UserDefaultsBirthdayKey=@"U_birthday";

//用户居住地
static NSString * const UserDefaultsAddressKey=@"U_address";

//用户教育程度
static NSString * const UserDefaultsEducationKey=@"U_education";

////用户头像
//static NSString * const UserDefaultsAvatarKey=@"U_avatar";

//用户投资经验
static NSString * const UserDefaultsExperienceKey=@"U_experience";

/** 0: 未登录或注销 1: 登录*/
static NSString * const YNUserDefaultsPatientLoginStatusKey = @"p_loginStatus";


@interface UserDefaultsUtility (YjYLoginUser)

///** 保存登录用户的相关信息*/
//+ (void)modifyUserDefaultsWithPatientObject:(ECGPatientObject *)patientObject loginPassword:(NSString *)loginPassword;

/** 登录用户注销后，清除相关信息*/
+ (void)clearLoginPatientInfo;

/** 判断当前用户是否登录过。如果NSUserDefaults里已存信息，则开启免登录；否则弹出登录窗口*/
+ (BOOL)isLogined;

/** 判断当前用户是否处于登录状态。如果是返回TRUE,否则返回FALSE(未登录或注销)*/
+ (BOOL)isLoginON;

/** 判断是否是第一次使用app。如果是返回TRUE,否则返回FALSE*/
+ (BOOL)isFirstInstallApp;


@end

//
//  YjYBaseDrawerViewController.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYBaseViewController.h"
#import "CSDrawerControllerViewController.h"
#import "YjYBaseViewController.h"
/**
 * 用于管理主界面侧滑栏的一系列界面
 */

@interface YjYBaseDrawerViewController : YjYBaseViewController<CSDrawerControllerChild,CSDrawerControllerPresenting>

@property(nonatomic,weak)CSDrawerControllerViewController * drawer;

@end

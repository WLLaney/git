//
//  YjYMainViewController.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYBaseDrawerViewController.h"

@class YjyMainPageViewController;
@interface YjYMainViewController : YjYBaseDrawerViewController<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

-(YjyMainPageViewController* )getMainPageViewController;

@end

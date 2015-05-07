//
//  YjyMainPageViewController.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYBaseDrawerViewController.h"

@interface YjyMainPageViewController : YjYBaseDrawerViewController<CSDrawerControllerPresenting>

@property (weak, nonatomic) IBOutlet UILabel *radioLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsLabel;
@property (weak, nonatomic) IBOutlet UILabel *safeLabel;
@property (weak, nonatomic) IBOutlet UILabel *profitLabel;
@property (weak, nonatomic) IBOutlet UILabel *systemLabel;

@end

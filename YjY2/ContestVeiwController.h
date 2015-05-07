//
//  ContestVeiwController.h
//  YjY
//
//  Created by 王磊 on 15/5/5.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContestVeiwController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *contestListButton;
@property (weak, nonatomic) IBOutlet UIButton *myContestButton;
@property (weak, nonatomic) IBOutlet UILabel *contestLineLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *contestScroll;
@end

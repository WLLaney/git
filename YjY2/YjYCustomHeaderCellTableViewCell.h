//
//  YjYCustomHeaderCellTableViewCell.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YjYCustomHeaderCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *goldIngotLabel;

@property (weak, nonatomic) IBOutlet UILabel *traderLabel;

/** 清空UI上界面信息*/
- (void)resetUserInfo;

/** 刷新UI界面信息*/
- (void)refreshUserInfo;
@end

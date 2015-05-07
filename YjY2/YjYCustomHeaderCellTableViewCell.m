//
//  YjYCustomHeaderCellTableViewCell.m
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYCustomHeaderCellTableViewCell.h"

@implementation YjYCustomHeaderCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - public method
- (void)resetUserInfo
{
    [self p_resetInfo];
}

- (void)p_resetInfo
{
    self.nameLabel.text = @"您还没有登录";
    self.balanceLabel.text =@"账户余额：";
    self.goldIngotLabel.text =@"金元宝：";
    self.traderLabel.text =@"操盘券：";
//    self.headerImage.image = [UIImage imageWithBundle:[NSBundle mainBundle] imageName:IMAGE_user_default];
}

- (void)refreshUserInfo
{
    [self p_refreshUserInfo];
}

-(void)p_refreshUserInfo
{
    
}
@end

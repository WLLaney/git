//
//  ApplyTableViewCell.m
//  YjY
//
//  Created by 王磊 on 15/5/4.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "ApplyTableViewCell.h"

@implementation ApplyTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    UIView *container_ = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
//    container_.layer.cornerRadius = 5.0;
//    self.backgroundView=container_;
//    self.layer.masksToBounds=YES;
    self.frame=CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width-30, 125);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

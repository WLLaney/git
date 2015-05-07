//
//  YjYCustomImageCell.h
//  YjY
//
//  Created by 王磊 on 15/5/4.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YjYCustomImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;

@property (weak, nonatomic) IBOutlet UILabel *introLabel;

- (void)setAvatarWith:(UIImage *)image;

@end

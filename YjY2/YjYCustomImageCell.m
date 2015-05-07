//
//  YjYCustomImageCell.m
//  YjY
//
//  Created by 王磊 on 15/5/4.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYCustomImageCell.h"
#import "YjYUIControlMarco.h"

@implementation YjYCustomImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setAvatarWith:(UIImage *)image
{
    if (!image)
    {
        return;
    }
    
    self.leftImage.frame = CGRectMake(YjY_X(self.leftImage.frame), YjY_Y(self.leftImage.frame), image.size.width, image.size.height);
    self.leftImage.image = image;

}
@end

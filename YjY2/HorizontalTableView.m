//
//  HorizontalTableView.m
//  YjY2
//
//  Created by 王磊 on 15/5/7.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "HorizontalTableView.h"

@implementation HorizontalTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame transform:(CGAffineTransform)transform
{
    self=[super initWithFrame:frame];
    if (self) {
        self.transform=transform;
        self.backgroundColor=[UIColor whiteColor];
    }
    
    return self;
}
@end

//
//  Register.m
//  SDKSample
//
//  Created by mhealth365 on 15/5/7.
//
//

#import "Register.h"

@implementation Register

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [self p_configUI];
}

- (void)p_configUI
{
    
    // args
    // 全屏背景
    self.backgroundColor = [UIColor colorWithRed:63.0/255.0 green:63.0/255.0 blue:63.0/255.0 alpha:0.6];
    self.frame = [UIScreen mainScreen].bounds;
    
    self.alertView.frame = CGRectMake((self.frame.size.width - self.alertView.frame.size.width ) / 2, (self.frame.size.height - self.alertView.frame.size.height) / 2, self.alertView.frame.size.width, self.alertView.frame.size.height+20);
    self.alertView.backgroundColor = [UIColor whiteColor];
    
    [self.cancelButton addTarget:self action:@selector(p_cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    self.confirmButton.backgroundColor=[UIColor colorWithRed:42/225.0 green:119/225.0 blue:226/225.0 alpha:1.0];
}


- (void)p_cancel:(id)sender
{
    [self fadeOut];
}

#pragma mark - public method
- (void)showInView:(UIView *)view animated:(BOOL)animated
{
    [view addSubview:self];
    if (animated) {
        [self fadeIn];
    }
}


#pragma mark -
#pragma mark view animate
- (void)fadeIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)fadeOut
{
    
    [UIView animateWithDuration:.35 animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}



@end

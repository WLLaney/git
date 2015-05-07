//
//  loginAndRegistView.m
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "loginAndRegistView.h"
#import "Register.h"

#import "YjYUIControlMarco.h"

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//十六进制转换

static int const loginButtonColor=0xde5037;
//static int const loginTitleColor=0xfff;
static int const registButtonColor=0x64a0d7;
static int const backgroundColor=0x1b1b1b;
static NSString * const loginTitle=@"登录";
static NSString * const registTitle=@"注册";
@implementation loginAndRegistView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)init
{
    self=[super init];
    if (self) {
        
        self.backgroundColor=HexRGB(backgroundColor);
        self.alpha=0.9;
        
        //登录按钮
        UIButton* loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        loginButton.layer.cornerRadius=0.7;
        loginButton.frame=CGRectMake(25, 20, 120, 50);
        [loginButton setBackgroundColor:HexRGB(loginButtonColor)];
        [loginButton setTitle:loginTitle forState:UIControlStateNormal];
        [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //注册按钮
        UIButton* registButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        registButton.frame=CGRectMake(175, 20, 120, 50);
        [registButton setBackgroundColor:HexRGB(registButtonColor)];
        [registButton setTitle:registTitle forState:UIControlStateNormal];
        [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [registButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:loginButton];
        [self addSubview:registButton];
    }
    
    return self;
}

-(void)regist
{
    Register * registView=[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([Register class]) owner:self options:nil] objectAtIndex:0];
    registView.layer.cornerRadius=0.7;
    registView.layer.masksToBounds=YES;

    [registView showInView:self.superview animated:YES];
}
@end

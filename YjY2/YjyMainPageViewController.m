//
//  YjyMainPageViewController.m
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjyMainPageViewController.h"
#import "loginAndRegistView.h"
#import "CSDrawerControllerViewController.h"

#import "YjyResourcesConst.h"

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//十六进制转换


@interface YjyMainPageViewController ()

@end

static int const radioLabelColor=0xf2f2f2;
static NSString* const closeImage=@"关闭@2x";
static int const viewTag=100;

@implementation YjyMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configUI];
}

//首页界面
-(void)configUI
{
    //self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setBackgroundColor:HexRGB(mainPageNBColor)];
    [self.navigationController.navigationBar setBarTintColor:HexRGB(mainPageNBColor)];
    
    NSLog(@"尺寸：%f",[UIScreen mainScreen].bounds.size.width);
    UIImageView* logo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:logoName]];
    logo.contentMode=UIViewContentModeScaleAspectFit;
    //    if ([UIScreen mainScreen].bounds.size.width==320.0) {
    //        //logo.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, (44-30)/2, 100, 30);
    //    }else if ([UIScreen mainScreen].bounds.size.width==375){
    //
    //        logo.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-150*(320/375))/2, (64-40)/2, 150*(320/375), 40);
    //    }else{
    //        logo.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-150*(375/414))/2, (64-40)/2, 150*(375/414), 40);
    //    }
    self.navigationItem.titleView=logo;
    self.radioLabel.backgroundColor=HexRGB(radioLabelColor);
    self.newsLabel.textColor=HexRGB(newsLabelColor);
    self.safeLabel.textColor=HexRGB(newsLabelColor);
    self.profitLabel.textColor=HexRGB(newsLabelColor);
    self.systemLabel.textColor=HexRGB(newsLabelColor);

    loginAndRegistView * view=[[loginAndRegistView alloc]init];
    view.frame=CGRectMake(0,480, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-view.frame.origin.y);
    view.tag=viewTag;
    [self.tabBarController.view addSubview:view];
    
    //创建关闭按钮
    UIButton* closelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [closelButton addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
    [closelButton setBackgroundImage:[UIImage imageNamed:closeImage] forState:UIControlStateNormal];
    closelButton.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-30, view.frame.origin.y-27, 25, 25);
    [self.view addSubview:closelButton];

    
}

#pragma mark    ------leftBarButtonItemClick----------

- (IBAction)openDrawer:(id)sender {
    [self.drawer open];
}

#pragma mark - CSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(CSDrawerControllerViewController *)drawerController
{
    self.view.userInteractionEnabled = NO;
    NSLog(@"fewf");
}

- (void)drawerControllerDidClose:(CSDrawerControllerViewController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

#pragma mark    ------关闭按钮点击事件-----------
-(void)closeClick:(UIButton* )btn
{
    for (UIView* view in self.tabBarController.view.subviews) {
        if (view.tag==viewTag) {
            [view removeFromSuperview];
        }
    }
    [btn removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

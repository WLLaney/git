//
//  YjYBaseViewController.m
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYBaseViewController.h"
#import "UserDefaultsUtility.h"
#import "UserDefaultsUtility+YjYLoginUser.h"

@interface YjYBaseViewController ()

@end

@implementation YjYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - private method - 注意私有方法被子类重写

- (BOOL)p_isNeededLogin
{
    BOOL isLogined = [UserDefaultsUtility isLogined];
    return isLogined;
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

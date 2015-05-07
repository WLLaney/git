//
//  personalCenterViewController.h
//  YjY2
//
//  Created by 王磊 on 15/5/6.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalTableView.h"

@interface personalCenterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    HorizontalTableView * currentAgreementTableView;
    HorizontalTableView * myContestTableView;
}
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UILabel *newsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel2;
@property (weak, nonatomic) IBOutlet UILabel *middleLIneLabel;

@property (weak, nonatomic) IBOutlet UILabel *goldLabel;
@property (weak, nonatomic) IBOutlet UILabel *goldCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *traderLabel;

@property (weak, nonatomic) IBOutlet UILabel *traderCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentAgreementLabel;
@property (weak, nonatomic) IBOutlet UILabel *myContestLabel;

@end

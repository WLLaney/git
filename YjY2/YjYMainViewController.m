//
//  YjYMainViewController.m
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "YjYMainViewController.h"
#import "YjyMainPageViewController.h"
#import "CSDrawerControllerViewController.h"

#import "YjyResourcesConst.h"
#import "YjYUIControlMarco.h"
#import "YjYAPPConst.h"

#import "YjYCustomHeaderCellTableViewCell.h"
#import "YjYCustomImageCell.h"

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//十六进制转换


typedef NS_ENUM(NSInteger, ECGMainViewPageIndex)
{
    /** 侧滑栏index: 个人信息*/
    ECGMainViewPageIndexOfProfile = 0,
    /** 侧滑栏index: 买入*/
    ECGMainViewPageIndexOfBuy = 1,
    /** 侧滑栏index: 卖出*/
    ECGMainViewPageIndexOfSale = 2,
    /** 侧滑栏index: 充值*/
    ECGMainViewPageIndexOfRecharge = 3,
    /** 侧滑栏index: 实盘申请T+N*/
    ECGMainViewPageIndexOfTN = 4,
    /** 侧滑栏index: 实盘申请T+9*/
    ECGMainViewPageIndexOfT9 = 5,
    /** 侧滑栏index: 实盘大赛*/
    ECGMainViewPageIndexOfContest = 6,
    /** 侧滑栏index: 个人中心*/
    ECGMainViewPageIndexOfPersonal = 7,
    /** 侧滑栏index: 新手帮助*/
    ECGMainViewPageIndexOfHelp = 8
};


@interface YjYMainViewController ()
{
    YjyMainPageViewController* MainPageVC;
    
    YjYCustomHeaderCellTableViewCell * headerCell_;
}

@property(nonatomic,strong)NSArray * avatars;
@property(nonatomic,strong)NSArray * titles;

@end

@implementation YjYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self m_configUI];
    [self m_configData];
}

-(void)m_configData
{
    // 数据源
    self.avatars = [[NSArray alloc] initWithObjects:IMAGE_null,IMAGE_buy, IMAGE_sell, IMAGE_recharge, IMAGE_tn, IMAGE_tnine, IMAGE_contest,IMAGE_info,IMAGE_help, nil];
    
    self.titles = [[NSArray alloc] initWithObjects:
                   kNULL,
                   NSLocalizedString(@"买入", nil),
                   NSLocalizedString(@"卖出", nil),
                   NSLocalizedString(@"充值", nil),
                   NSLocalizedString(@"实盘申请T+N", nil),
                   NSLocalizedString(@"实盘申请T+9", nil),
                   NSLocalizedString(@"实盘大赛", nil),
                   NSLocalizedString(@"个人中心", nil),
                   NSLocalizedString(@"新手帮助", nil),nil];

}
-(void)m_configUI
{
    
    self.mainTableView.backgroundColor=HexRGB(tabViewBackgroundColor);
    self.mainTableView.backgroundView=self.imageView;
    //self.imageView.backgroundColor=HexRGB(tabViewBackgroundColor);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(YjyMainPageViewController* )getMainPageViewController
{
    if (!MainPageVC) {
        UIStoryboard* storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MainPageVC=[storyboard instantiateViewControllerWithIdentifier:@"YjyMainPageViewController"];
    }
    return MainPageVC;

}

#pragma mark - ICSDrawerControllerPresenting
// will 显示抽屉
- (void)drawerControllerWillOpen:(CSDrawerControllerViewController *)drawerController
{
    self.view.userInteractionEnabled = NO;
    
}

// did 显示抽屉
- (void)drawerControllerDidOpen:(CSDrawerControllerViewController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

// will 弹出视图
- (void)drawerControllerWillClose:(CSDrawerControllerViewController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

// did 弹出视图
- (void)drawerControllerDidClose:(CSDrawerControllerViewController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}


#pragma mark ---------UITableViewDelegate------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == YjY_SECTION_FIRST)
    {
        return self.avatars.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == YjY_SECTION_FIRST && indexPath.row == Yjy_ROW_FIRST)
    {
        return Yjy_CELL_HEADER_HEIGHT_CUSTOM;
    }
    return YjY_CELL_HEIGHT_CUSTOM;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 第一行
    if (indexPath.row == YjY_SECTION_FIRST && indexPath.row == Yjy_ROW_FIRST)
    {
        YjYCustomHeaderCellTableViewCell *headerCell = (YjYCustomHeaderCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YjYCustomHeaderCellTableViewCell class])];
        if (!headerCell) {
            headerCell = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([YjYCustomHeaderCellTableViewCell class]) owner:self options:nil] objectAtIndex:0];
        }
        [headerCell refreshUserInfo];
        headerCell_ = headerCell;
        headerCell_.nameLabel.textColor=HexRGB(nameColor);
        headerCell_.balanceLabel.textColor=HexRGB(nameColor);
        headerCell_.goldIngotLabel.textColor=HexRGB(goldColor);
        headerCell_.traderLabel.textColor=HexRGB(goldColor);
        headerCell_.backgroundColor=[UIColor clearColor];
        UIView *backgroundViews = [[UIView alloc]initWithFrame:headerCell_.frame];
        backgroundViews.backgroundColor = HexRGB(selectCellBackgroundColor);
        [headerCell_ setSelectedBackgroundView:backgroundViews];
        return headerCell;
    }
    
    // 其他行
    YjYCustomImageCell *cell = (YjYCustomImageCell *)[tableView dequeueReusableCellWithIdentifier:YjY_CELL_TYPE_CUSTOM_IMAGE];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YjYCustomImageCell class]) owner:self options:nil] objectAtIndex:0];
    }
    [cell setAvatarWith:[UIImage imageNamed:[self.avatars objectAtIndex:indexPath.row]]];
    cell.introLabel.text = [self.titles objectAtIndex:indexPath.row];
    cell.introLabel.textColor=HexRGB(introTextColor);
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    UIView *backgroundViews = [[UIView alloc]initWithFrame:cell.frame];
    backgroundViews.backgroundColor = HexRGB(selectCellBackgroundColor);
    [cell setSelectedBackgroundView:backgroundViews];

    
    return cell;
    
    
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

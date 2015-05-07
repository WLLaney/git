//
//  personalCenterViewController.m
//  YjY2
//
//  Created by 王磊 on 15/5/6.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "personalCenterViewController.h"

#import "YjyResourcesConst.h"
#import "YjYUIControlMarco.h"

#import "HorizontalTableView.h"
#import "personcenterCell.h"

#define TABLE_BACKGROUND_COLOR		[UIColor whiteColor]
#define BORDER_VIEW_TAG             10

static int const konwDetailButtonTextColor      =0xff6a09;
static int const noLabelTextColor               =0x333333;

@interface personalCenterViewController ()

@property(nonatomic,strong)UITableView * agreementTableView;
@property(nonatomic,strong)NSArray * agreementCountArray;
@property(nonatomic,strong)NSArray * myContestCountArray;

//@property(nonatomic) HorizontalTableView * currentAgreementTableView;


@end

@implementation personalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_configUI];
    [self p_configData];
}

-(void)p_configUI
{
    //导航条设置
    [self.navigationController.navigationBar setBackgroundColor:HexRGB(mainPageNBColor)];
    [self.navigationController.navigationBar setBarTintColor:HexRGB(mainPageNBColor)];
    UIImageView* logo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:logoName]];
    logo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=logo;
    
    self.bgImg.backgroundColor=HexRGB(bgColor);
    self.newsLabel.textColor=HexRGB(newsLabelColor);
    self.lineLabel.backgroundColor=self.lineLabel2.backgroundColor=self.middleLIneLabel.backgroundColor=HexRGB(bgColor);
    self.phoneLabel.textColor=self.balanceLabel.textColor=HexRGB(phoneLabelColor);
    self.moneyLabel.textColor=HexRGB(moneyLabelColor);
    self.goldLabel.textColor=self.goldCountLabel.textColor=self.traderLabel.textColor=self.traderCountLabel.textColor=HexRGB(goldLabelColor);
    self.currentAgreementLabel.textColor=self.myContestLabel.textColor=HexRGB(noLabelTextColor);
    
    [self setupCurrentAgreementTableView];
    [self setupMyContestTableView];
}

-(void)p_configData
{
    self.agreementCountArray=[[NSArray alloc]initWithObjects:@"fsf",@"fsf",@"fsfsf", nil];
    self.myContestCountArray=[[NSArray alloc]initWithObjects:@"wfw",@"grg",@"grg", nil];
    self.currentAgreementLabel.text=[NSString stringWithFormat:@"当前合约(%d)",self.agreementCountArray.count];
    self.myContestLabel.text=[NSString stringWithFormat:@"我的大赛(%d)",self.myContestCountArray.count];
}

//当前合约表格
-(void)setupCurrentAgreementTableView
{
    CGRect frameRect=CGRectMake(MAINSCREEN_WIDTH-75-125, self.currentAgreementLabel.frame.origin.y+self.currentAgreementLabel.bounds.size.height-125+8,85, MAINSCREEN_WIDTH);
    
    currentAgreementTableView=[[HorizontalTableView alloc]initWithFrame:frameRect transform:CGAffineTransformMakeRotation(-M_PI/2)];
    currentAgreementTableView.dataSource=self;
    currentAgreementTableView.delegate=self;
    currentAgreementTableView.rowHeight=MAINSCREEN_WIDTH/3;
    
    [self.view addSubview:currentAgreementTableView];
    
}

//我的大赛表格
-(void)setupMyContestTableView
{
    CGRect frameRect=CGRectMake(currentAgreementTableView.frame.origin.x+115, currentAgreementTableView.frame.origin.y+8,currentAgreementTableView.bounds.size.width, currentAgreementTableView.bounds.size.height);
    myContestTableView=[[HorizontalTableView alloc]initWithFrame:frameRect transform:CGAffineTransformMakeRotation(-M_PI/2)];
    myContestTableView.rowHeight=MAINSCREEN_WIDTH/3;
    [self.view addSubview:myContestTableView];
}

#pragma mark      UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.agreementCountArray.count;
}


-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    personcenterCell * cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([personcenterCell class])];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([personcenterCell class]) owner:self options:nil]objectAtIndex:0];
        
        
    }
    
    //cell.transform=CGAffineTransformMakeRotation(M_PI/2);
    
    if (tableView==currentAgreementTableView) {
        cell.contentView.transform=CGAffineTransformMakeRotation(M_PI/2);
        [cell.knowDetailButton setTitleColor:HexRGB(konwDetailButtonTextColor) forState:UIControlStateNormal];
        cell.noLabel.textColor=cell.modelLabel.textColor=HexRGB(noLabelTextColor);
    }
    
    return cell;
}

// Optional delegate to track the selection of a particular cell



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

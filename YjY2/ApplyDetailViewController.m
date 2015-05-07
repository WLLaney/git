//
//  ApplyDetailViewController.m
//  YjY
//
//  Created by 王磊 on 15/5/4.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "ApplyDetailViewController.h"

#import "YjYUIControlMarco.h"
#import "YjyResourcesConst.h"
#import "YjYAPPConst.h"

#import "kindOfMoneyTableViewCell.h"
#import "PayTableViewCell.h"

@interface ApplyDetailViewController ()
{
    UIButton * lastButton;
}

@property(nonatomic,strong)NSArray * middleArray;
@end

@implementation ApplyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_configUI];
    [self p_configData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden=NO;
}

//初始化界面
-(void)p_configUI
{

    //导航条设置
    [self.navigationController.navigationBar setBackgroundColor:HexRGB(mainPageNBColor)];
    [self.navigationController.navigationBar setBarTintColor:HexRGB(mainPageNBColor)];
    UIImageView* logo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:logoName]];
    logo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=logo;

    //自定义leftBarButtonItem
    self.navigationItem.hidesBackButton = YES;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 4, 40, 40)];
    [leftButton setBackgroundImage:[UIImage imageNamed:backItem] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
    
//    //自定义rightBarButtonItem
//    UIButton *rightbutton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-40, 4, 40, 40)];
//    [rightbutton setBackgroundImage:[UIImage imageNamed:rightItem] forState:UIControlStateNormal];
//    [rightbutton addTarget:self action:@selector(rightkAction) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
//    self.navigationItem.rightBarButtonItem = right;

    
    self.tabBarController.tabBar.hidden=YES;
    
    self.lineLabel.backgroundColor=HexRGB(lineColor);
    self.scrollView.pagingEnabled=YES;
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2.0, self.scrollView.frame.size.height);
    
    for (int i=0; i<2; i++) {
        UITableView * tab=[[UITableView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.bounds.size.height)];
        tab.dataSource=self;
        tab.delegate=self;
        tab.tag=tableViewTag*i;
        [self.scrollView addSubview:tab];
    }
}

-(void)p_configData
{
    self.middleArray=[[NSArray alloc]initWithObjects:kNULL,
                      NSLocalizedString(@"money", nil),
                      NSLocalizedString(@"management expense", nil),
                      NSLocalizedString(@"open line", nil),
                      NSLocalizedString(@"bond", nil), nil];
    lastButton=0;

}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark      IBACtion
- (IBAction)T1Click:(UIButton * )sender {
//    [lastButton setTitleColor:HexRGB(buttonColor) forState:UIControlStateNormal];
//    [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    //lastButton=sender;
    [self.scrollView setContentOffset:CGPointMake(YjY_SECTION_FIRST, YjY_SECTION_FIRST) animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.lineLabel.frame=CGRectMake(YjY_SECTION_FIRST, self.lineLabel.frame.origin.y, self.lineLabel.bounds.size.width, self.lineLabel.bounds.size.height);
    [UIView commitAnimations];

}
- (IBAction)T9Click:(UIButton * )sender {
    
//    [lastButton setTitleColor:HexRGB(buttonColor) forState:UIControlStateNormal];
//    [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    //lastButton=sender;
    [self.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.lineLabel.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-self.lineLabel.bounds.size.width, self.lineLabel.frame.origin.y, self.lineLabel.bounds.size.width, self.lineLabel.bounds.size.height);
    [UIView commitAnimations];
}

#pragma mark     UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        return T1tableViewSectionCount;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        return 1;
    }
        return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        if (section==5) {
            return 40;
        }
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        if (indexPath.section==YjY_SECTION_FIRST) {
            //kindOfMoneyTableViewCell* moneyCell=(kindOfMoneyTableViewCell * )[tableView dequeueReusableCellWithIdentifier:MONEY_CELL];
           
               kindOfMoneyTableViewCell * moneyCell=[[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([kindOfMoneyTableViewCell class]) owner:self options:nil] objectAtIndex:0];
                
                return moneyCell;
        }
        else if (indexPath.section==5){
            PayTableViewCell* payCell=[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PayTableViewCell class]) owner:self options:nil] objectAtIndex:0];
            payCell.payButton.backgroundColor=HexRGB(payButtonColor);
            payCell.payButton.layer.cornerRadius=0.6;
            payCell.layer.masksToBounds=YES;
            
            return payCell;
        }
        else
        {
            UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:CELL];
            if (!cell) {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELL];
                cell.textLabel.text=[self.middleArray objectAtIndex:indexPath.section];
                cell.textLabel.textColor=HexRGB(textLabelColor);
                cell.detailTextLabel.textColor=HexRGB(detailLabelColor);
            }
            
            return cell;
        }
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        if (indexPath.section==YjY_SECTION_FIRST) {
            return 146;
        }else if (indexPath.section==5){
            return 80;
        }
        else{
            return 60;
        }
    }
    return 0;
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

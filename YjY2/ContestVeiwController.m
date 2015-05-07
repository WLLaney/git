//
//  ContestVeiwController.m
//  YjY
//
//  Created by 王磊 on 15/5/5.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "ContestVeiwController.h"

#import "YjyResourcesConst.h"
#import "YjYUIControlMarco.h"

#import "contestListTableViewCell.h"

@interface ContestVeiwController ()

@property(nonatomic,strong)NSArray * contestListArray;

@end

@implementation ContestVeiwController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self c_configUI];
    [self c_configData];
}

//初始化界面
-(void)c_configUI
{
    [self.contestListButton setBackgroundColor:HexRGB(bgColor)];
    [self.myContestButton setBackgroundColor:HexRGB(bgColor)];
    self.contestLineLabel.backgroundColor=HexRGB(lineColor);
    [self.contestListButton setTitleColor:HexRGB(goldColor) forState:UIControlStateNormal];
    [self.myContestButton setTitleColor:HexRGB(goldColor) forState:UIControlStateNormal];
    
    //导航条设置
    [self.navigationController.navigationBar setBackgroundColor:HexRGB(mainPageNBColor)];
    [self.navigationController.navigationBar setBarTintColor:HexRGB(mainPageNBColor)];
    UIImageView* logo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:logoName]];
    logo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=logo;
    
    //自定义leftBarButtonItem
    self.navigationItem.hidesBackButton = YES;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 4, 40, 40)];
    [leftButton setBackgroundImage:[UIImage imageNamed:leftItem] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
    
    //自定义rightBarButtonItem
    UIButton *rightbutton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-40, 4, 40, 40)];
    [rightbutton setBackgroundImage:[UIImage imageNamed:rightItem] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(rightkAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    self.navigationItem.rightBarButtonItem = right;

    self.contestScroll.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2, self.contestScroll.bounds.size.height);
    self.contestScroll.pagingEnabled=YES;
    
    for (int i=0; i<2; i++) {
        UITableView * tab=[[UITableView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, self.contestScroll.bounds.size.height)];
        tab.dataSource=self;
        tab.delegate=self;
        tab.tag=tableViewTag*i;
        [self.contestScroll addSubview:tab];
    }

}

-(void)c_configData
{
    self.contestListArray=[[NSArray alloc]initWithObjects:@"fwf",@"grge",@"lrg",nil];
}

#pragma mark        UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        return 1;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        return self.contestListArray.count;
    }
    return 0;
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        contestListTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:contestCell];
        if (!cell) {
            cell=[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([contestListTableViewCell class]) owner:self options:nil] objectAtIndex:0];
        }
        
        cell.peopleCountLabel.textColor=HexRGB(peopleCountLabelTextColor);
        cell.categoryLabel.textColor=HexRGB(peopleCountLabelTextColor);
        return cell;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==YjY_SECTION_FIRST) {
        return tableViewTag;
    }
    return 0;
}

#pragma mark     IBAction
- (IBAction)actionClick:(UIButton *)sender {
    if (sender.tag==contestListButtonTag) {
        [self.contestScroll setContentOffset:CGPointMake(YjY_SECTION_FIRST, YjY_SECTION_FIRST) animated:YES];
    }
    else
    {
        [self.contestScroll setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, YjY_SECTION_FIRST) animated:YES];
    }
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

//
//  ApplyViewController.m
//  YjY
//
//  Created by 王磊 on 15/5/4.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import "ApplyViewController.h"

#import "YjYUIControlMarco.h"
#import "YjyResourcesConst.h"

#import "ApplyTableViewCell.h"
#import "ApplyDetailViewController.h"

@interface ApplyViewController ()

@property(nonatomic,strong)NSArray * kindOfActivity;

@end

@implementation ApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_configUI];
}

-(void)p_configUI
{
    //导航条设置
    [self.navigationController.navigationBar setBackgroundColor:HexRGB(mainPageNBColor)];
    [self.navigationController.navigationBar setBarTintColor:HexRGB(mainPageNBColor)];
    UIImageView* logo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:logoName]];
    logo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=logo;
    
    self.bgImage.backgroundColor=HexRGB(bgColor);
    self.tableView.backgroundView=self.bgImage;
    self.kindOfActivity=[[NSArray alloc]initWithObjects:@"fsfsf",@"fsfs", nil];
    self.tableView.rowHeight=80;
    //self.navigationItem.rightBarButtonItem=
}
#pragma mark      UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.kindOfActivity.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ApplyTableViewCell *Cell = (ApplyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:APPLY_CUSTOM_CELL];
    if (!Cell) {
        Cell = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([ApplyTableViewCell class]) owner:self options:nil] objectAtIndex:0];
        
        Cell.YjYLabel.textColor=HexRGB(textColor);
        Cell.sumLabel.textColor=HexRGB(textColor);
        Cell.peopleCountLabel.textColor=HexRGB(textColor);
        
        Cell.rotatioinLabel.transform=CGAffineTransformMakeRotation(M_PI_4);
    }

    return Cell;
}

-(UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == YjY_SECTION_FIRST) {
        UILabel * titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 30)];
        titleLabel.textColor=HexRGB(goldColor);
        titleLabel.text=title;
        
        return titleLabel;

       }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == YjY_SECTION_FIRST) {
        return APPLY_FIRST_SECTION_HEAD_HEIGHT;

    }
    return APPLY_OTER_SECTION_HEAD_HEIGHT;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard* storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ApplyDetailViewController * vc=[storyboard instantiateViewControllerWithIdentifier:@"ApplyDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
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

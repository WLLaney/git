//
//  Register.h
//  SDKSample
//
//  Created by mhealth365 on 15/5/7.
//
//

#import <UIKit/UIKit.h>

@interface Register : UIView
@property (retain, nonatomic) IBOutlet UIButton *cancelButton;
@property (retain, nonatomic) IBOutlet UIImageView *topImageView;
@property (retain, nonatomic) IBOutlet UIImageView *phoneImage;
@property (retain, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (retain, nonatomic) IBOutlet UIImageView *passwordImage;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain, nonatomic) IBOutlet UIImageView *verifyImage;
@property (retain, nonatomic) IBOutlet UITextField *verifyNumberTextField;
@property (retain, nonatomic) IBOutlet UIButton *sendAgainButton;
@property (retain, nonatomic) IBOutlet UILabel *tipLabel;
@property (retain, nonatomic) IBOutlet UIButton *confirmButton;
@property (retain, nonatomic) IBOutlet UIView *alertView;

/** 弹出提示*/
- (void)showInView:(UIView *)view animated:(BOOL)animated;

@end

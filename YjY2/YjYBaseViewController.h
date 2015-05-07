//
//  YjYBaseViewController.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  YjYBaseViewControllerDelegate;

@interface YjYBaseViewController : UIViewController

@property(nonatomic,assign) id<YjYBaseViewControllerDelegate> delegate;


@end

@protocol YjYBaseViewControllerDelegate <NSObject>


@end
//
//  CSDrawerControllerViewController.h
//  YjY
//
//  Created by 王磊 on 15/4/30.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CSDrawerControllerChild;
@protocol CSDrawerControllerPresenting;

@interface CSDrawerControllerViewController : UIViewController

@property(nonatomic, strong, readonly) UIViewController<CSDrawerControllerChild, CSDrawerControllerPresenting> *leftViewController;
@property(nonatomic, strong, readonly) UIViewController<CSDrawerControllerChild, CSDrawerControllerPresenting> *centerViewController;
- (id)initWithLeftViewController:(UIViewController<CSDrawerControllerChild, CSDrawerControllerPresenting> *)leftViewController
            centerViewController:(UIViewController<CSDrawerControllerChild, CSDrawerControllerPresenting> *)centerViewController;
- (void)open;
- (void)close;
- (void)reloadCenterViewControllerUsingBlock:(void (^)(void))reloadBlock;
- (void)replaceCenterViewControllerWithViewController:(UIViewController<CSDrawerControllerChild, CSDrawerControllerPresenting> *)viewController;

@end


@protocol CSDrawerControllerChild <NSObject>

/**
 The drawer object for this child controller
 */
@property(nonatomic, weak) CSDrawerControllerViewController *drawer;

@end

@protocol  CSDrawerControllerPresenting <NSObject>

@optional
/**
 Tells the child controller that the drawer controller is about to open.
 
 @param drawerController The drawer object that is about to open.
 */
- (void)drawerControllerWillOpen:(CSDrawerControllerViewController *)drawerController;
/**
 Tells the child controller that the drawer controller has completed the opening phase and is now open.
 
 @param drawerController The drawer object that is now open.
 */
- (void)drawerControllerDidOpen:(CSDrawerControllerViewController *)drawerController;
/**
 Tells the child controller that the drawer controller is about to close.
 
 @param drawerController The drawer object that is about to close.
 */
- (void)drawerControllerWillClose:(CSDrawerControllerViewController *)drawerController;
/**
 Tells the child controller that the drawer controller has completed the closing phase and is now closed.
 
 @param drawerController The drawer object that is now closed.
 */
- (void)drawerControllerDidClose:(CSDrawerControllerViewController *)drawerController;

@end
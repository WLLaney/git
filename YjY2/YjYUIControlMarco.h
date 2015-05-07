//
//  YjYUIControlMarco.h
//  YjY
//
//  Created by 王磊 on 15/5/4.
//  Copyright (c) 2015年 王磊. All rights reserved.
//

#ifndef YjY_YjYUIControlMarco_h
#define YjY_YjYUIControlMarco_h

#define YjY_SECTION_FIRST                            0
#define Yjy_ROW_FIRST                                0
#define Yjy_CELL_HEADER_HEIGHT_CUSTOM                50+96+10
#define YjY_CELL_HEIGHT_CUSTOM                       54

#define APPLY_FIRST_SECTION_HEAD_HEIGHT              40.0
#define APPLY_OTER_SECTION_HEAD_HEIGHT               10

//----------------------------------tableView设置
#define YjY_CELL_TYPE_CUSTOM_IMAGE                   @"ImageCustomCell"
#define APPLY_CUSTOM_CELL                            @"ApplyCustomCell"
#define CELL                                         @"Cell"

//----------------------------------Size 设置
#define YjY_HEIGHT(rect)                             CGRectGetHeight(rect)
#define YjY_WIDTH(rect)                              CGRectGetWidth(rect)
#define YjY_X(rect)                                  CGRectGetMinX(rect)
#define YjY_Y(rect)                                  CGRectGetMinY(rect)

#define MAINSCREEN_WIDTH                             [UIScreen mainScreen].bounds.size.width
#define MAINSCREEN_HEIGHT                            [UIScreen mainScreen].bounds.size.height

//#define UIVIEW_ANIMATION(YjY_X(rect)) [UIView beginAnimations:nil context:nil]; \
//                                                                                  [UIView setAnimationDuration:0.5]; \
//self.lineLabel.frame=CGRectMake(YjY_X(rect), self.lineLabel.frame.origin.y, self.lineLabel.bounds.size.width, self.lineLabel.bounds.size.height);
//; \
//                                                                                  [UIView commitAnimations];
//

//----------------------------------颜色设置
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//十六进制转换


#endif

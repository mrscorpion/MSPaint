//
//  MSTabbarView.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTabbarView : UIView

/*
 *单个button的添加
 */
- (void)addTabbarButtonWithImage:(NSString *)image selectImage:(NSString *)selectImage andAction:(void(^)(void))action;
/**
 *根据MSButtonModel的数组来创建button
 
 */
- (void)addTAbbarButtomWithModels:(NSArray *)models;

@end

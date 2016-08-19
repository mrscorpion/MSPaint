//
//  MSColorSelectionButton.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/6/23.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSButtonModel;
typedef void(^buttonClick)(void);

@interface MSColorSelectionButton : UIView
@property (nonatomic,strong) MSButtonModel *model;
@property (nonatomic,strong) UIButton *button;

/*
 *添加button
 */
- (void)addButtonWithBlock:(buttonClick)block;

+ (MSColorSelectionButton *)sharedManager;
/**
 *改变背景颜色
 */
-(void)changegBackgranColor:(UIColor*)color;

@end

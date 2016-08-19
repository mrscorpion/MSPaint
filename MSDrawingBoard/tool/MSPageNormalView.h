//
//  MSPageNormalView.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSPageNormalView : UIView

- (id) initWithPageSize:(CGSize)pageSize;

/**
 *  @author SACRELEE, 2015-07-30 10:07:27
 *
 *  打开和关闭橡皮擦模式
 *
 *  @param is 是否启用橡皮擦模式
 */
- (void) eraseModeOn:(BOOL)is;


/**
 *
 *画板重置
 *
 */
-(void) resetDrawing;

// 是否用于绘制
//-(void) isUsedForDrawing:(BOOL)isDrawing;


@end

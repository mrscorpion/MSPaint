//
//  MSConfigManager.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/12.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MSConfigManager : NSObject
// 取单例
+(id)sharedInstance;

// 获取颜色数组
-(NSArray *)getStandardColorArray;

-(void)setFreeInkColorWithIndex:(NSInteger)index;
-(UIColor *)getFreeInkColor;
-(UIColor *)getFreeInkColorWithIndex:(NSInteger)index;
-(NSArray *)getInkColorValues;
-(NSString *)getInkColorString;
-(NSInteger)getInkColorIndex;

// 设定自由画笔笔迹宽度
-(void)setFreeInkLineWidth:(CGFloat)lineWidth;

-(CGFloat)getFreeInkLineWidth;



@end

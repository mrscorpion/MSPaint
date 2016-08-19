//
//  MSInkLine.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/12.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MSInkLine : NSObject

@property (nonatomic,assign) BOOL isEraseMode;
@property (nonatomic, strong) NSMutableArray *lineArr;
@property (nonatomic, assign) NSInteger colorIndex;
@property (nonatomic, assign) CGFloat lineWidth;

@end

//
//  MSInkLine.m
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/12.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSInkLine.h"

@implementation MSInkLine
- (instancetype)init
{
    self = [super init];
    if (self) {
        _lineArr = [NSMutableArray array];
    }
    return self;
}
@end

//
//  MSScratchImageView.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/31.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSScratchImageView : UIImageView
{
    CGPoint previousTouchLocation;
    CGPoint currentTouchLocation;
    
    CGImageRef hideImage;
    CGImageRef scratchImage;
    
    CGContextRef contextMask;
}

@end
 
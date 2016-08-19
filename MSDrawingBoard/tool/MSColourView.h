//
//  MSColourView.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/24.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^changeeraseModeOn) ();
@interface MSColourView : UIView

/**
 **上升
 
 */
- (void)goUp;


/**
 **下降
 
 */
- (void)goDown;



/*
 **设置点击Block
 */

- (void)eraseModeOnBlockChangOn:(changeeraseModeOn)changOn;

+ (MSColourView *)sharedManager;
@end

//
//  ViewController.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/10.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

+ (UIImage *)transToMosaicImage:(UIImage*)orginImage blockLevel:(NSUInteger)level;

@end


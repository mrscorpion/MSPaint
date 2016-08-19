//
//  MSColourView.m
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/24.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSColourView.h"
#import "Alldefined.h"
#import "MSConfigManager.h"
#import "MSColorSelectionButton.h"
@interface MSColourView()

@property (nonatomic,copy)changeeraseModeOn changBlock;

@end

@implementation MSColourView


- (void)eraseModeOnBlockChangOn:(changeeraseModeOn)changOn{
    
    _changBlock = changOn;
    
}



+ (MSColourView *)sharedManager
{
    static MSColourView *colourView = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        colourView = [[self alloc] init];
    });
    return colourView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    
//    NSLog(@"KColoUrViewHeight:%f  kColourWidth:%f",KColoUrViewHeight,kColourWidth);
    if (self = [super initWithFrame:CGRectMake(0, kheight, kwidth, KColoUrViewHeight)]) {
        [self prepareUI];
    }
    return self;
}


- (void)prepareUI{
    [self setUpButttonWithRow:KColourRow andTrain:KColourTrain];
    
    self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    
}


//创建颜色button

- (void)setUpButttonWithRow:(NSInteger)row andTrain:(NSInteger)train{
    
    //CGFloat height = ;
    //CGFloat width = (kwidth - (KColourTrain +1)*kColourGap)/KColourTrain;
    for (int i= 0; i < row *train; i++) {
        int a = i/12;
        int b =i%12;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((b+1)*kColourGap +b*kColourWidth, (a+1)*kColourGap+a*kColourWidth, kColourWidth, kColourWidth)];
        button.tag = 100+i;
        button.backgroundColor = [[MSConfigManager sharedInstance] getFreeInkColorWithIndex:i];
        //[button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
    
}
- (void)changeColor:(UIButton *)btn{
    [[MSConfigManager sharedInstance] setFreeInkColorWithIndex:btn.tag -100];
    
    [[MSColorSelectionButton sharedManager] changegBackgranColor:[[MSConfigManager sharedInstance] getFreeInkColorWithIndex:btn.tag - 100]];
    
    if (_changBlock!=nil) {
        _changBlock();
    }
    //NSLog(@"_____button.tag:%ld",(long)btn.tag);
    [self goDown];
    
    
}



- (void)goUp{
    
    [UIView animateWithDuration:1 animations:^{
        
        self.frame = CGRectMake(0, kheight-self.frame.size.height, kwidth, KColoUrViewHeight);
        
    }];
    

}

- (void)goDown{
    
    [UIView animateWithDuration:1 animations:^{
        self.frame = CGRectMake(0, kheight, kwidth, KColoUrViewHeight);
        
    }];
    
}



@end

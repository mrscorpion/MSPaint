//
//  MSColorSelectionButton.m
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/6/23.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSColorSelectionButton.h"
#import "MSButtonModel.h"
@interface MSColorSelectionButton()
@property (nonatomic,copy) buttonClick buttonClick;

@end

@implementation MSColorSelectionButton

+ (MSColorSelectionButton *)sharedManager
{
    static MSColorSelectionButton *colourView = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        colourView = [[self alloc] init];
    });
    return colourView;
}


- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:99/255.0 green:154/255.0 blue:68/255.0 alpha:1];
        
    }
    return self;
}


-(void)changegBackgranColor:(UIColor*)color{
    self.backgroundColor = color;
    
}



- (void)addButtonWithBlock:(buttonClick)block{
    _buttonClick = block;
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [_button setImage:[UIImage imageNamed:_model.image] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:_model.slectImage] forState:UIControlStateSelected];
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _button.selected = _model.isSelected;
    [self addSubview:_button];
}

- (void)buttonClick:(UIButton *)btn{
    _buttonClick();
    _model.action();
    
}



@end

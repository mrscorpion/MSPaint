//
//  MSButtonModel.h
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^buttonAction)(void);


@interface MSButtonModel : NSObject

@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *slectImage;

@property (nonatomic,assign) BOOL isSelected;//标记创建时是否是选中状态

@property (nonatomic,assign) BOOL isColorSelection;//标记是否是选色按钮

@property (nonatomic,copy) buttonAction action;



@end

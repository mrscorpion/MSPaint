//
//  MSPageNormalView.m
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/5/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSPageNormalView.h"
#import "MSInkLine.h"
#import "MSConfigManager.h"
#import "MSColourView.h"

@implementation MSPageNormalView
{
    BOOL _isEraseMode;  // 打开橡皮擦
    
    CGSize pageSize;
    NSMutableArray *curves;
    NSMutableArray *_erases;
    UIPanGestureRecognizer *_rec;
    UIColor *_lineColor;
    CGFloat _lineWidth;
    
}
static inline float fz_min(float a, float b)
{
    return (a < b ? a : b);
}
CGSize fitPageToScreen(CGSize page, CGSize screen)
{
    float hscale = screen.width / page.width;
    float vscale = screen.height / page.height;
    float scale = fz_min(hscale, vscale);
    hscale = floorf(page.width * scale) / page.width;
    vscale = floorf(page.height * scale) / page.height;
    return CGSizeMake(hscale, vscale);
}

- (id) initWithPageSize:(CGSize)_pageSize
{
    self = [super initWithFrame:CGRectMake(0, 0, _pageSize.width, _pageSize.height)];
    if (self) {
        [self setOpaque:NO];
        pageSize = _pageSize;
        curves = [NSMutableArray array];
        
        _rec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onDrag:)];
        [self addGestureRecognizer:_rec];
    }
    return self;
}
- (void) eraseModeOn:(BOOL)is{
    _isEraseMode = is;
    
}

//点击降下colourView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [[MSColourView sharedManager] goDown];
    
}

-(void) onDrag:(UIPanGestureRecognizer *)rec
{
    CGSize scale = fitPageToScreen(pageSize, self.bounds.size);
    CGPoint p = [rec locationInView:self];
    p.x /= scale.width;
    p.y /= scale.height;
    
    if (rec.state == UIGestureRecognizerStateBegan)
    {
        MSInkLine *il = [[MSInkLine alloc]init];
        il.lineArr = [[NSMutableArray alloc]init];
        il.colorIndex = [[MSConfigManager sharedInstance] getInkColorIndex];
        il.lineWidth = [[MSConfigManager sharedInstance] getFreeInkLineWidth];
        [curves addObject:il];
    }
    MSInkLine *il = [curves lastObject];
    il.isEraseMode = _isEraseMode;
    
    [il.lineArr addObject:[NSValue valueWithCGPoint:p]];
    
    [self setNeedsDisplay];
}
-(void) resetDrawing
{
    [curves removeAllObjects];
    [self setNeedsDisplay];
    
}


- (void)drawRect:(CGRect)rect
{
    CGSize scale = fitPageToScreen(pageSize, self.bounds.size);
    CGContextRef cref = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(cref, scale.width, scale.height);
    
        for (MSInkLine *il in curves)
        {
            CGFloat lineWidth = il.lineWidth;
            
            [[[MSConfigManager sharedInstance] getFreeInkColorWithIndex:il.colorIndex] set];
            
            CGContextSetLineWidth(cref, lineWidth);

            NSArray *curve = il.lineArr;
            if (curve.count >= 2)
            {
                CGPoint pt = [[curve objectAtIndex:0] CGPointValue];
                CGContextBeginPath(cref);
                CGContextMoveToPoint(cref, pt.x, pt.y);
                CGPoint lpt = pt;
                
                if (il.isEraseMode) {
                    //设置为圆头
                    CGContextSetLineCap(cref, kCGLineCapRound);
                    //设置清除颜色
                    CGContextSetBlendMode(cref, kCGBlendModeClear);
                    
                    CGContextSetLineWidth(cref, 20);
                }else{
                    
                    CGContextSetBlendMode(cref, kCGBlendModeNormal);
                }
            //CGContextSetStrokeColorWithColor(cref, [[[MSConfigManager sharedInstance] getFreeInkColorWithIndex:il.colorIndex] CGColor]);
                for (int i = 1; i < curve.count; i++)
                {
                    pt = [[curve objectAtIndex:i] CGPointValue];
                    CGContextAddQuadCurveToPoint(cref, lpt.x, lpt.y, (pt.x + lpt.x)/2, (pt.y + lpt.y)/2);
                    lpt = pt;
                }
                
                CGContextAddLineToPoint(cref, pt.x, pt.y);
                CGContextStrokePath(cref);
            }
        }
    
    
}


@end

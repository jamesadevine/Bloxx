//
//  Block.m
//  Bloxx
//
//  Created by James on 10/03/2014.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "Block.h"


@implementation Block

-(id)initWithX:(double)x initWithY:(double)y{
    _x=x;
    _y=y;
    _width=20;
    _height=20;
    if(self = [super initWithFrame:CGRectMake(x, y, _width, _height)])
    {
        
    }
    UISwipeGestureRecognizer* rightSwipe = [[UISwipeGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(handler:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:rightSwipe];
    //[self addTarget:self action:@selector(handler:) forControlEvents:UIControlEventTouchDragInside];
    return self;
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, rect);
}
-(void)handler:(id)sender{
    
    NSLog(@"BUTTON PRESSED");
}
@end


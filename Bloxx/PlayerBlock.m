//
//  PlayerBlock.m
//  Bloxx
//
//  Created by James on 10/03/2014.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "PlayerBlock.h"

@implementation PlayerBlock

@synthesize x=_x,y=_y,width=_width,height=_height,currentTimer=_currentTimer;

-(id)initWithX:(double)x initWithY:(double)y initWithBlocks:(NSMutableArray*)blocks{
    _startX=x;
    _startY=y;
    _x=x;
    _y=y;
    _width=20;
    _height=20;
    _blocks=blocks;
    if(self = [super initWithFrame:CGRectMake(x, y, _width, _height)])
    {
        
    }
    UISwipeGestureRecognizer* rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightHandler:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer* leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftHandler:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer* upSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(upHandler:)];
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer* downSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(downHandler:)];
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:rightSwipe];
    [self addGestureRecognizer:leftSwipe];
    [self addGestureRecognizer:upSwipe];
    [self addGestureRecognizer:downSwipe];

    return self;
}
-(void)rightHandler:(id)sender{
    NSLog(@"HANDLING RIGHT");
    [NSTimer scheduledTimerWithTimeInterval:0.0001f
                                         target:self
                                                      selector: @selector(moveRight:)
                                       userInfo:nil
                                        repeats:YES];
}

-(void)leftHandler:(id)sender{
    NSLog(@"HANDLING LEFT");
    [NSTimer scheduledTimerWithTimeInterval:0.0001f
                                     target:self
                                                  selector: @selector(moveLeft:)
                                   userInfo:nil
                                    repeats:YES];

}
-(void)upHandler:(id)sender{
    NSLog(@"HANDLING UP");
    [NSTimer scheduledTimerWithTimeInterval:0.0001f
                                     target:self
                                                  selector: @selector(moveUp:)
                                   userInfo:nil
                                    repeats:YES];
}
-(void)downHandler:(id)sender{
    NSLog(@"HANDLING DOWN");
    [NSTimer scheduledTimerWithTimeInterval:0.0001f
                                     target:self
                                   selector: @selector(moveDown:)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)moveRight:(id)sender{
    NSTimer *timer =(NSTimer*)sender;
    if([self collidedWithBlockRight])
        [timer invalidate];
    else if([self outsideView]){
        [timer invalidate];
        self.frame=CGRectMake(_startX, _startY, _width, _height);
        _x=_startX;
        _y=_startY;
        [self setNeedsDisplay];
    }else{
        self.frame=CGRectMake(_x, _y, _width, _height);
        _x+=1;
        [self setNeedsDisplay];
    }
    
}
-(void)moveLeft:(id)sender{
    NSTimer *timer =(NSTimer*)sender;
    if([self collidedWithBlockLeft])
        [timer invalidate];
    else if([self outsideView]){
        [timer invalidate];
        self.frame=CGRectMake(_startX, _startY, _width, _height);
        _x=_startX;
        _y=_startY;
        [self setNeedsDisplay];
    }else{
        self.frame=CGRectMake(_x, _y, _width, _height);
        _x-=1;
        [self setNeedsDisplay];
    }
    
}
-(void)moveUp:(id)sender{
    NSTimer *timer =(NSTimer*)sender;
    if([self collidedWithBlockUp])
        [timer invalidate];
    else if([self outsideView]){
        [timer invalidate];
        self.frame=CGRectMake(_startX, _startY, _width, _height);
        _x=_startX;
        _y=_startY;
        [self setNeedsDisplay];
    }else{
        self.frame=CGRectMake(_x, _y, _width, _height);
        _y-=1;
        [self setNeedsDisplay];
    }
    
}
-(void)moveDown:(id)sender{
    NSTimer *timer =(NSTimer*)sender;
    if([self collidedWithBlockDown])
        [timer invalidate];
    else if([self outsideView]){
        [timer invalidate];
        self.frame=CGRectMake(_startX, _startY, _width, _height);
        _x=_startX;
        _y=_startY;
        [self setNeedsDisplay];
    }else{
        self.frame=CGRectMake(_x, _y, _width, _height);
        _y+=1;
        [self setNeedsDisplay];
    }
    
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextFillRect(context, rect);
}
-(BOOL)collidedWithBlockRight{
    for(int i=0;i<[_blocks count];i++){
        Block* b=[_blocks objectAtIndex:i];
        CGRect rect1=CGRectMake(_x, _y, _width, _height);
        CGRect rect2=CGRectMake(b.x-1, b.y, b.width, b.height);
        if(CGRectIntersectsRect (rect1,rect2))
            return true;
    }
    return false;
}
-(BOOL)collidedWithBlockLeft{
    for(int i=0;i<[_blocks count];i++){
        Block* b=[_blocks objectAtIndex:i];
        CGRect rect1=CGRectMake(_x, _y, _width, _height);
        CGRect rect2=CGRectMake(b.x+1, b.y, b.width, b.height);
        if(CGRectIntersectsRect (rect1,rect2))
            return true;

    }
    return false;
}
-(BOOL)collidedWithBlockUp{
    for(int i=0;i<[_blocks count];i++){
        Block* b=[_blocks objectAtIndex:i];
        CGRect rect1=CGRectMake(_x, _y, _width, _height);
        CGRect rect2=CGRectMake(b.x, b.y+1, b.width, b.height);
        if(CGRectIntersectsRect (rect1,rect2))
            return true;
    }
    return false;
}
-(BOOL)collidedWithBlockDown{
    for(int i=0;i<[_blocks count];i++){
        Block* b=[_blocks objectAtIndex:i];
        CGRect rect1=CGRectMake(_x, _y, _width, _height);
        CGRect rect2=CGRectMake(b.x, b.y-1, b.width, b.height);
        if(CGRectIntersectsRect (rect1,rect2))
            return true;

    }
    return false;
}
-(BOOL)outsideView{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    return _x>screenWidth||_x<0||_y>screenHeight||_y<0?true:false;
}
@end

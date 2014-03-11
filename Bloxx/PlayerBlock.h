//
//  PlayerBlock.h
//  Bloxx
//
//  Created by James on 10/03/2014.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "Block.h"

@interface PlayerBlock : Block
@property int width;
@property int height;

@property double x;
@property double y;

@property double startX;
@property double startY;

@property NSMutableArray* blocks;

@property NSTimer* currentTimer;

-(id)initWithX:(double)x initWithY:(double)y initWithBlocks:(NSMutableArray*)blocks;
@end

//
//  Block.h
//  Bloxx
//
//  Created by James on 10/03/2014.
//  Copyright (c) 2014 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Block: UIButton

-(id)initWithX:(double)x initWithY:(double)y;
@property int width;
@property int height;

@property double x;
@property double y;


@end

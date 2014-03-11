//
//  ViewController.m
//  Bloxx
//
//  Created by James on 10/03/2014.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "ViewController.h"
#import "Block.h"
#import "PlayerBlock.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *blocks= [[NSMutableArray alloc]init];
    
    Block* b = [[Block alloc]initWithX:100 initWithY:100];
    [blocks addObject:b];
    [_gameView addSubview:b];
    b = [[Block alloc]initWithX:40 initWithY:120];
    [blocks addObject:b];
    [_gameView addSubview:b];
    b = [[Block alloc]initWithX:60 initWithY:60];
    [blocks addObject:b];
    [_gameView addSubview:b];
    b = [[Block alloc]initWithX:160 initWithY:80];
    [blocks addObject:b];
    [_gameView addSubview:b];
    
    PlayerBlock* Pb=[[PlayerBlock alloc]initWithX:100 initWithY:300 initWithBlocks:blocks];
    
    [_gameView addSubview:Pb];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

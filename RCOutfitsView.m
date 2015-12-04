//
//  RCOutfitsView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCOutfitsView.h"

@implementation RCOutfitsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    
    return self;
}

#pragma mark - OutfitImageDelegate methods

- (void)favorite:sender
{
    [self.delegate favorite:sender];
}

- (void)comments:sender
{
    [self.delegate comments:sender];
}

- (void)dressCode:sender
{
    [self.delegate dressCode:sender];
}

- (void)style:sender
{
    [self.delegate style:sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

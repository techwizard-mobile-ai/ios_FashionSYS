//
//  RCOutfitImageView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/4/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCOutfitImageView.h"

@implementation RCOutfitImageView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    //UI Constants
    CGFloat toolBarHeight = TAB_BAR_HEIGHT;
    CGFloat toolBarWidth = AVAILABLE_WIDTH;
    
    //configure button items
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    _favoriteButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favorite-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(favorite:)];
    
#pragma clang diagnostic pop
    
    //configure toolbar
    _actionToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(DEFAULT_X, frame.size.height - TAB_BAR_HEIGHT, toolBarWidth, toolBarHeight)];
    

    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

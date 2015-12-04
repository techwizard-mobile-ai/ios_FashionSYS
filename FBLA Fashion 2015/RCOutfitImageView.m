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
    
    //configure button items & supress warnings for undeclared selector - the delegate has the selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    //TODO: Add the icon files
    
    _favoriteButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favorite-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(favorite:)];
    _commentsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comments-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(comments:)];
    _dressCodeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"dress-code-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(dressCode:)];
    _styleButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"style-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(style:)];
    
#pragma clang diagnostic pop
    
    //configure toolbar
    _actionToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(DEFAULT_X, frame.size.height - TAB_BAR_HEIGHT, toolBarWidth, toolBarHeight)];
    _toolBarItems = [[NSMutableArray alloc] initWithObjects:_favoriteButton, _commentsButton, _dressCodeButton, _styleButton, nil];
    
    _actionToolBar.items = _toolBarItems;  //add the toolbar items to the toolbar
    
    [self addSubview:_actionToolBar];  //add the toolbar to the view
    
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

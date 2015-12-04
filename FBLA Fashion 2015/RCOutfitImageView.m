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
    CGFloat toolBarHeight = TAB_BAR_HEIGHT * 2;
    CGFloat toolBarWidth = AVAILABLE_WIDTH;
    CGFloat imageViewX = DEFAULT_X;
    CGFloat imageViewY = 0;
    CGFloat imageViewWidth = AVAILABLE_WIDTH;
    CGFloat imageViewHeight = frame.size.height - toolBarHeight;
    PADDING = 10;
    IMAGE_WIDTH = AVAILABLE_WIDTH - PADDING * 2;
    IMAGE_HEIGHT = AVAILABLE_HEIGHT - NAVIGATION_BAR_HEIGHT - toolBarHeight - TAB_BAR_HEIGHT - PADDING * 2;
    
    //configure button items & supress warnings for undeclared selector - the delegate has the selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];  //space between buttons
    
    _favoriteButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favorite-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(favorite:)];
    _commentsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comments-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(comments:)];
    _dressCodeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"dress-code-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(dressCode:)];
    _styleButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"style-button-icon.png"] landscapeImagePhone:NULL style:UIBarButtonItemStylePlain target:self.delegate action:@selector(style:)];
    
    _favoriteButton.title = @"Favorite";
    _commentsButton.title = @"Comments";
    _dressCodeButton.title = @"Dress Code";
    _styleButton.title = @"Style";
    
    //TODO: Change font sizes
    
#pragma clang diagnostic pop
    
    //configure toolbar
    _actionToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(DEFAULT_X, frame.size.height - toolBarHeight, toolBarWidth, toolBarHeight)];
    _toolBarItems = [[NSArray alloc] initWithObjects:_favoriteButton, flexibleSpace, _commentsButton, flexibleSpace, _dressCodeButton, flexibleSpace, _styleButton, nil];  //create array with the toolbar items
    
    _actionToolBar.items = _toolBarItems;  //set the toolbar items to the toolbar
    
    [self addSubview:_actionToolBar];  //add the toolbar to the container
    
    //configure imageview
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeight)];
    
    [self addSubview:_imageView];  //add the image to the container
    
    return self;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = [UIImage imageWithImage:image scaledToSize:CGSizeMake(IMAGE_WIDTH, IMAGE_HEIGHT)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

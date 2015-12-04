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
    
    _outfitImageViews = [[NSMutableArray alloc] init];
    
    _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    //testing
    RCOutfitImageView* imageView = [[RCOutfitImageView alloc] initWithFrame:CGRectMake(0, 0, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT)];
    imageView.delegate = self;
    [imageView setImage:[UIImage imageNamed:@"outfit1.png"]];
    [self addOutfit:imageView];
    
    [self addSubview:_imageScrollView];  //add the scroll view to the view
    
    return self;
}

- (void)addOutfit:(RCOutfitImageView*)outfit
{
    [_outfitImageViews addObject:outfit];  //add the outfit to the data source
    
    outfit.frame = CGRectMake(outfit.frame.origin.x, outfit.frame.origin.y + _imageScrollView.frame.size.height, AVAILABLE_WIDTH, outfit.frame.size.height);  //set frame to be end of current scrollview
    
    _imageScrollView.frame = CGRectMake(_imageScrollView.frame.origin.x, _imageScrollView.frame.origin.y, _imageScrollView.frame.size.width + outfit.frame.size.width, _imageScrollView.frame.size.height + outfit.frame.size.height);  //extend the scroll view too accomdate the new image
    
    [_imageScrollView addSubview:outfit];  //add the new image to the view
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

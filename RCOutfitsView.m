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
    
    _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, AVAILABLE_WIDTH, frame.size.height)];
    
    [self addSubview:_imageScrollView];  //add the scroll view to the view
    
    return self;
}

- (void)addOutfit:(RCOutfitImageView*)outfit
{
    [_outfitImageViews addObject:outfit];  //add the outfit to the data source
    
    outfit.frame = CGRectMake(outfit.frame.origin.x, outfit.frame.origin.y + _imageScrollView.contentSize.height, _imageScrollView.contentSize.width, outfit.frame.size.height);  //set frame to be end of current scrollview by moving y-coordinate down
    
    _imageScrollView.contentSize = CGSizeMake(_imageScrollView.contentSize.width, _imageScrollView.contentSize.height + outfit.frame.size.height);  //extend the scroll view to accomdate the new image
    //_imageScrollView.frame = CGRectMake(_imageScrollView.frame.origin.x, _imageScrollView.frame.origin.y, _imageScrollView.contentSize.width, _imageScrollView.contentSize.height);
    
    [_imageScrollView addSubview:outfit];  //add the new image to the view
}

- (void)addOutfitWithImage:(UIImage*)image
{
    //configure the image view
    RCOutfitImageView* imageView = [[RCOutfitImageView alloc] initWithFrame:CGRectMake(0, 0, AVAILABLE_WIDTH, _imageScrollView.frame.size.height)];
    imageView.delegate = self;
    [imageView setImage:image];
    
    //add the imageview to the scrollview
    [self addOutfit:imageView];
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

#pragma mark - UITabBarDelegate Methods

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self.delegate tabBar:tabBar didSelectItem:item];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

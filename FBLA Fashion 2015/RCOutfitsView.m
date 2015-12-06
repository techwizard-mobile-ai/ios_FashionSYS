//
//  RCOutfitsView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCOutfitsView.h"

@implementation RCOutfitsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    _outfitImageViews = [[NSMutableArray alloc] init];
    
    //configure the scrollview
    self.userInteractionEnabled = YES;
    self.pinchGestureRecognizer.enabled = NO;
    self.panGestureRecognizer.enabled = NO;
    self.scrollEnabled = YES;
    self.userInteractionEnabled = YES;
    
    return self;
}

- (void)addOutfit:(RCOutfitImageView*)outfit
{
    [_outfitImageViews addObject:outfit];  //add the outfit to the data source
    
    outfit.frame = CGRectMake(outfit.frame.origin.x, outfit.frame.origin.y + self.contentSize.height, self.contentSize.width, outfit.frame.size.height);  //set frame to be end of current scrollview by moving y-coordinate down
    
    self.contentSize = CGSizeMake(self.contentSize.width, self.contentSize.height + outfit.frame.size.height);  //extend the scroll view to accomdate the new image
    //_imageScrollView.frame = CGRectMake(_imageScrollView.frame.origin.x, _imageScrollView.frame.origin.y, _imageScrollView.contentSize.width, _imageScrollView.contentSize.height);
    
    [self addSubview:outfit];  //add the new image to the view
    
    //add the toolbar to the scrollview - if it's deeper in the view hierarchy, it won't respond to touch events
    outfit.actionToolBar.frame = CGRectMake(0, outfit.actionToolBar.frame.origin.y + outfit.frame.origin.y, outfit.actionToolBar.frame.size.width, outfit.actionToolBar.frame.size.height);
    [self addSubview:outfit.actionToolBar];
}

- (void)addOutfitWithImage:(UIImage*)image delegate:(id)delegate number:(NSUInteger)number favorites:(NSUInteger)favorites style:(NSUInteger)style dressCode:(NSUInteger)dressCode comments:(NSUInteger)comments
{
    //configure the image view
    RCOutfitImageView* imageView = [[RCOutfitImageView alloc] initWithFrame:CGRectMake(0, 0, AVAILABLE_WIDTH, self.frame.size.height)];
    imageView.delegate = delegate;
    imageView.imageNumber = number;
    imageView.userInteractionEnabled = YES;
    [imageView setImage:image];
    
    //update the labels
    imageView.favoriteLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)favorites];
    imageView.styleLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)style];
    imageView.dressCodeLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)dressCode];
    imageView.commentsLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)comments];

    
    //add the imageview to the scrollview
    [self addOutfit:imageView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  RCOutfitImageView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "BorderMaker.h"

@class RCOutfitImageView;

@protocol OutfitImageDelegate <NSObject>  //delegate to act on the button presses

@required
- (void)favorite:(RCOutfitImageView*)sender;
@required
- (void)comments:(RCOutfitImageView*)sender;
@required
- (void)dressCode:(RCOutfitImageView*)sender;
@required
- (void)style:(RCOutfitImageView*)sender;

@end

@interface RCOutfitImageView : UIView
{
    CGFloat PADDING, IMAGE_WIDTH, IMAGE_HEIGHT;
}

@property UIView* actionToolBar; //contains the buttons
@property UIView* statsToolBar; //contains the stats
@property UIImageView* imageView; //contains the image
@property NSUInteger imageNumber; //contains the outfit number

//buttons to change stats
@property UIButton* favoriteButton;
@property UIButton* commentsButton;
@property UIButton* dressCodeButton;
@property UIButton* styleButton;

//labels to display stats
@property UILabel* favoriteLabel;
@property UILabel* commentsLabel;
@property UILabel* dressCodeLabel;
@property UILabel* styleLabel;

@property (nonatomic, weak) id<OutfitImageDelegate> delegate;

- (void)setImage:(UIImage*)image;  //sets the image contained in the view

@end

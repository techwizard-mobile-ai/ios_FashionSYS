//
//  RCOutfitImageView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/4/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "BorderMaker.h"

@protocol OutfitImageDelegate <NSObject>  //delegate to act on the button presses

@required
- (void)favorite:(id)sender;
- (void)comments:(id)sender;
- (void)dressCode:(id)sender;
- (void)style:(id)sender;

@end

@interface RCOutfitImageView : UIView
{
    CGFloat PADDING, IMAGE_WIDTH, IMAGE_HEIGHT;
}

@property UIView* actionToolBar;
@property NSArray* toolBarItems;  //array to hold the items on the toolbar
@property UIImageView* imageView;

@property UIButton* favoriteButton;
@property UIButton* commentsButton;
@property UIButton* dressCodeButton;
@property UIButton* styleButton;

@property (nonatomic, weak) id<OutfitImageDelegate> delegate;

- (void)setImage:(UIImage*)image;  //sets the image contained in the view

@end

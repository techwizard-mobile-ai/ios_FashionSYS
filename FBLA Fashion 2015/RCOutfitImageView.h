//
//  RCOutfitImageView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/4/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

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

@property UIToolbar* actionToolBar;
@property NSArray* toolBarItems;  //array to hold the items on the toolbar
@property UIImageView* imageView;

@property UIBarButtonItem* favoriteButton;
@property UIBarButtonItem* commentsButton;
@property UIBarButtonItem* dressCodeButton;
@property UIBarButtonItem* styleButton;

@property (nonatomic, weak) id<OutfitImageDelegate> delegate;

- (void)setImage:(UIImage*)image;  //sets the image contained in the view

@end

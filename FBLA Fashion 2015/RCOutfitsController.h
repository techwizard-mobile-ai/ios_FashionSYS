//
//  RCOutfitsControllerViewController.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCOutfitsView.h"

@interface RCOutfitsController : UINavigationController <OutfitImageDelegate, UIScrollViewDelegate, UITabBarDelegate>

@property RCOutfitsView* outfits;
@property UIButton* refreshButton;
@property UIActivityIndicatorView* uploadSpinner;

- (void)favorite:(RCOutfitImageView*)sender;
- (void)comments:(RCOutfitImageView*)sender;
- (void)style:(RCOutfitImageView*)sender;
- (void)dressCode:(RCOutfitImageView*)sender;


@end

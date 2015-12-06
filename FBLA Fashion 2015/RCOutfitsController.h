//
//  RCOutfitsControllerViewController.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCOutfitsView.h"
#import "RCCommentsViewController.h"

@interface RCOutfitsController : UIViewController <OutfitImageDelegate, UIScrollViewDelegate, UITabBarDelegate>

@property RCOutfitsView* outfits; //view containing outfits
@property UIButton* refreshButton; //button to initiate image refresh
@property UIActivityIndicatorView* uploadSpinner; //spinner to indicate image refresh

//methods for reacting to button pushes
- (void)favorite:(RCOutfitImageView*)sender;
- (void)comments:(RCOutfitImageView*)sender;
- (void)style:(RCOutfitImageView*)sender;
- (void)dressCode:(RCOutfitImageView*)sender;

@end

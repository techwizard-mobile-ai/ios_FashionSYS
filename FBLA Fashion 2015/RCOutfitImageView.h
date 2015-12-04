//
//  RCOutfitImageView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/4/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@protocol OutfitImageDelegate <NSObject>

@required
- (void)favorite;
- (void)comments;
- (void)dressCode;
- (void)style;

@end

@interface RCOutfitImageView : UIImageView

@property UIToolbar* actionToolBar;

@property UIBarButtonItem* favoriteButton;
@property UIBarButtonItem* commentsButton;
@property UIBarButtonItem* dressCodeButton;
@property UIBarButtonItem* styleButton;

@property (nonatomic, weak) id<OutfitImageDelegate> delegate;

@end

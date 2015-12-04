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
- (void)favorite:(id)sender;
- (void)comments:(id)sender;
- (void)dressCode:(id)sender;
- (void)style:(id)sender;

@end

@interface RCOutfitImageView : UIImageView

@property UIToolbar* actionToolBar;
@property NSMutableArray* toolBarItems;  //array to hold the items on the toolbar

@property UIBarButtonItem* favoriteButton;
@property UIBarButtonItem* commentsButton;
@property UIBarButtonItem* dressCodeButton;
@property UIBarButtonItem* styleButton;

@property (nonatomic, weak) id<OutfitImageDelegate> delegate;

@end

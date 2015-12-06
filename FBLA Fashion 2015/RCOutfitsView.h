//
//  RCOutfitsView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "RCOutfitImageView.h"

@interface RCOutfitsView : UIScrollView <UITabBarDelegate>

@property NSMutableArray* outfitImageViews;

//adds an outfit with a large amount of data
- (void)addOutfitWithImage:(UIImage*)image delegate:(id)delegate number:(NSUInteger)number favorites:(NSUInteger)favorites style:(NSUInteger)style dressCode:(NSUInteger)dressCode comments:(NSUInteger)comments;


@end

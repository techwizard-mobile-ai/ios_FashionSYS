//
//  Constants.h
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/19/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#ifndef Constants_m
#define Constants_m

#import "Constants.h"

// UI Constants and Macros

NSString *const APP_FONT = @"TheanoModern-Regular";
NSString *const APP_TITLE = @"RED CARPET";

// Interfaces

@implementation UIColor (RCScheme)

+(UIColor *) RCBackgroundColor { return [UIColor colorWithRed:(155/255.0) green:(13/255.0) blue:(40/255.0) alpha:1.0]; }
+(UIColor*) RCNavigationBarBackgroundColor { return [UIColor colorWithRed:(169/255.0) green:(169/255.0) blue:(169/255.0) alpha:1.0]; }

@end

@implementation UIImage (RCScheme)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

@implementation UIButton (VerticalLayout)

- (void)centerVertically
{
    // the space between the image and text
    CGFloat spacing = 6.0;
    
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
}


@end

// Names

NSString* const FAVORITE_ICON = @"favorite-button-icon.png";
NSString* const FAVORITE_ICON_SELECTED = @"favorite-button-icon-selected.png";
NSString* const COMMENTS_ICON = @"comments-button-icon.png";
NSString* const COMMENTS_ICON_SELECTED = @"comments-button-icon-selected.png";
NSString* const DRESS_CODE_ICON = @"dress-code-button-icon.png";
NSString* const DRESS_CODE_ICON_SELECTED = @"dress-code-button-icon-selected.png";
NSString* const STYLE_ICON = @"style-button-icon.png";
NSString* const STYLE_ICON_SELECTED = @"style-button-icon-selected.png";

// URL's

NSString *const DRESS_CODE_URL = @"http://pafbla.org/downloads/12-13_Web_Postings/+12_SLW_Documents/Pennsylvania_FBLA_Dress_Code_rev_May_19_2012.pdf";


#endif /* Constants_m */

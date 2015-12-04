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

NSString *const APP_FONT = @"TheanoModern-Regular";
NSString *const APP_TITLE = @"RED CARPET";
NSString *const DRESS_CODE_URL = @"http://pafbla.org/downloads/12-13_Web_Postings/+12_SLW_Documents/Pennsylvania_FBLA_Dress_Code_rev_May_19_2012.pdf";

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

#endif /* Constants_m */

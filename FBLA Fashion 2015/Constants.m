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

@implementation UIColor (RCScheme)

+(UIColor *) RCBackgroundColor { return [UIColor colorWithRed:(155/255.0) green:(13/255.0) blue:(40/255.0) alpha:1.0]; }

@end

#endif /* Constants_m */

//
//  Constants.h
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/19/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#import <UIKit/UIKit.h>

// UI Constants and Macros
extern NSString* const APP_FONT;
extern NSString* const APP_TITLE;

#define AVAILABLE_HEIGHT ([[UIScreen mainScreen] bounds].size.height - [UIApplication sharedApplication].statusBarFrame.size.height)
#define AVAILABLE_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define DEFAULT_Y [UIApplication sharedApplication].statusBarFrame.size.height
#define DEFAULT_X 0

#define TAB_BAR_HEIGHT [[UITabBarController alloc] init].tabBar.frame.size.height

@interface UIColor (RCScheme)

+(UIColor*) RCBackgroundColor;
+(UIColor*) RCNavigationBarBackgroundColor;

@end

// URL's
extern NSString* const DRESS_CODE_URL;

//protocols

@protocol EndLoginProcessProtocol <NSObject>

- (void)switchToTabBar;

@end



#endif /* Constants_h */

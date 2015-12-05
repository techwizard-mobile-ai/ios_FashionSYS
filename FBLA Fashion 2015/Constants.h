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
#define NAVIGATION_BAR_HEIGHT [[UINavigationController alloc] init].navigationBar.frame.size.height


// Interfaces

@interface UIColor (RCScheme)  //class methods for using the default color schemes easily

+(UIColor*) RCBackgroundColor;
+(UIColor*) RCNavigationBarBackgroundColor;

@end

@interface UIImage (RCScheme)  //resizing an image

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end

@interface UIButton (VerticalLayout)

- (void)centerVertically;

@end


// Names

extern NSString* const FAVORITE_ICON;
extern NSString* const FAVORITE_ICON_SELECTED;
extern NSString* const COMMENTS_ICON;
extern NSString* const COMMENTS_ICON_SELECTED;
extern NSString* const DRESS_CODE_ICON;
extern NSString* const DRESS_CODE_ICON_SELECTED;
extern NSString* const STYLE_ICON;
extern NSString* const STYLE_ICON_SELECTED;

// URL's

extern NSString* const DRESS_CODE_URL;  //URL linking to the dress code PDF


// Protocols

@protocol EndLoginProcessProtocol <NSObject>  //for ending the login process and switching to the main app view

@required
- (void)switchToTabBar;

@end



#endif /* Constants_h */

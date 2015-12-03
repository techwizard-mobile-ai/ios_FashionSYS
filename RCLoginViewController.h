//
//  LoginViewController.h
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/18/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "AppDelegate.h"
#import "RCMainTabController.h"

#import "RCLoginView.h"


@class RCLoginViewController;

@interface RCLoginViewController : UIViewController <EndLoginProcessProtocol>

@end

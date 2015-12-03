//
//  RCRegisterViewController.h
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "RCRegisterView.h"

@interface RCRegisterViewController : UIViewController <UITextFieldDelegate>

@property RCRegisterView* registerView;

@property UIAlertController* passwordTooShort;
@property UIAlertController* passwordsDontMatch;
@property UIAlertController* registrationSuccessful;
@property UIAlertController* registrationFailed;

@end

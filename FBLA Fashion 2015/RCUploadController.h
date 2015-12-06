//
//  RCUploadController.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCUploadView.h"

@interface RCUploadController : UIViewController <RCUploadImageProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property RCUploadView* uploadView;
@property UIAlertController* successAlert;
@property UIActivityIndicatorView* uploadSpinner;

@end

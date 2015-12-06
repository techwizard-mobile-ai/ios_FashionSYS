//
//  RCCommentsViewController.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "RCCommentsView.h"
#import "RCOutfitImageView.h"

@interface RCCommentsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, RCCommentsViewDelegate, UITextFieldDelegate>

@property PFObject* objectData; //contains the data for the image
@property RCOutfitImageView* imageView;
@property NSMutableArray* comments;
@property RCCommentsView* commentsView;

@property UIBarButtonItem* exitButton; //exits the comments view
@property UIBarButtonItem* addCommentButton; //adds a comment

@property UIAlertController* addCommentController; //alert to allow for comment typing

- (id)initWithPFObject:(PFObject*)object; //initialize with all the data in the PFObject, as that's what is needed

@end

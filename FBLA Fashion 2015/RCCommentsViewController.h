//
//  RCCommentsViewController.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/5/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "RCCommentsView.h"
#import "RCOutfitImageView.h"

@interface RCCommentsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, RCCommentsViewDelegate, UITextFieldDelegate>

@property PFObject* objectData;
@property RCOutfitImageView* imageView;
@property NSMutableArray* comments;
@property RCCommentsView* commentsView;

@property UIBarButtonItem* exitButton;
@property UIBarButtonItem* addCommentButton;

@property UIAlertController* addCommentController;

- (id)initWithPFObject:(PFObject*)object;

@end

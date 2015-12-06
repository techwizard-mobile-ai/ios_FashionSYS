//
//  RCCommentsView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/5/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@protocol RCCommentsViewDelegate <NSObject>

@required
- (void)addComment;
- (void)quit;

@end

@interface RCCommentsView : UITableView

@property UITableView* commentsTable;


@end

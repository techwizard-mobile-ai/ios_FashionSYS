//
//  RCCommentsView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/5/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCCommentsView.h"

@implementation RCCommentsView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    // UI Constants
    CGFloat buttonBarHeight = TAB_BAR_HEIGHT;
    
    _commentsTable = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

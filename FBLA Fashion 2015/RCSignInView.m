//
//  RCSignInView.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCSignInView.h"

@implementation RCSignInView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.backgroundColor = [UIColor RCBackgroundColor];

    return self;
}

@end

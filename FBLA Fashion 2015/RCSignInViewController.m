//
//  RCSignInViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCSignInViewController.h"
#import "RCSignInView.h"

@implementation RCSignInViewController

- (id)init
{
    self = [super init];
    
    self.view = [[RCSignInView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT)];
    
    self.title = @"Sign In";
    
    return self;
}

@end
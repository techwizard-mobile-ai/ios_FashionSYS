//
//  RCRegisterViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCRegisterViewController.h"
#import "RCRegisterView.h"

@implementation RCRegisterViewController

- (id)init
{
    self = [super init];
    
    self.view = [[RCRegisterView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT)];
    
    self.title = @"Register";
    
    return self;
}

@end

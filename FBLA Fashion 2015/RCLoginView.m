//
//  LoginView.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/19/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCLoginView.h"


@implementation RCLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    
    //view background color
    [self setBackgroundColor:[UIColor RCBackgroundColor]];
    
    _signInButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [_signInButton setTitle:@"sign in" forState:UIControlStateNormal];
    [_signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signInButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _signInButton.titleLabel.font = [UIFont fontWithName:APP_FONT size:24];
    [_signInButton sizeToFit];
    
    [self addSubview:_signInButton];
    
    
    return self;
}

@end

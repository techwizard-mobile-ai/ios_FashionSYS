//
//  RCDressCodeView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCDressCodeView.h"

@implementation RCDressCodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
 
    NSURLRequest* dressCodeRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:DRESS_CODE_URL]];  //create the url request
    [self loadRequest:dressCodeRequest];  //load the request
    self.scalesPageToFit = YES;  //scale the page
    
    return self;
}

@end

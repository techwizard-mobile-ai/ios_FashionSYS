//
//  RCUploadView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/5/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCUploadView.h"

@implementation RCUploadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    //configure the upload button to be the whole screen and to send a message to the delegate when touched
    _uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [_uploadButton setTitle:@"Tap to upload an image!" forState:UIControlStateNormal];
    _uploadButton.titleLabel.numberOfLines = 3;
    _uploadButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [_uploadButton addTarget:self.delegate action:@selector(beginImageUploadProcess) forControlEvents:UIControlEventTouchUpInside];
    [_uploadButton setBackgroundColor:[UIColor RCBackgroundColor]];
    
    [self addSubview:_uploadButton];
    
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

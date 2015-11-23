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
    
    //Fonts
    int TITLE_FONT_SIZE = 36;
    int BUTTON_FONT_SIZE = 24;
    
    //UI Constants
    CGFloat NUM_HORIZONTAL_ELEMENTS = 3; //number of elements in the row
    CGFloat BUTTON_PADDING = AVAILABLE_WIDTH / NUM_HORIZONTAL_ELEMENTS / (NUM_HORIZONTAL_ELEMENTS + 1); //space between buttons and other elements
    CGFloat VERTICAL_PERCENTAGE = .05; //magic number from LucidChart
    CGFloat TITLE_PADDING = AVAILABLE_WIDTH * .03; //magic number from LucidChart
    
    //Widths and Heights
    CGFloat buttonWidth = AVAILABLE_WIDTH / 2 - BUTTON_PADDING * 2;
    CGFloat buttonHeight = VERTICAL_PERCENTAGE * AVAILABLE_HEIGHT;
    CGFloat redCarpetLabelWidth = AVAILABLE_WIDTH - TITLE_PADDING * 2;
    CGFloat redCarpetLabelHeight = [APP_TITLE sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:APP_FONT size:TITLE_FONT_SIZE]}].height;
    
    
    
    //Positioning
    CGFloat redCarpetLabelX = TITLE_PADDING;
    CGFloat redCarpetLabelY = AVAILABLE_HEIGHT / 2 - redCarpetLabelHeight;
    CGFloat signInButtonX = BUTTON_PADDING;
    CGFloat registerButtonX = AVAILABLE_WIDTH - BUTTON_PADDING - buttonWidth;
    CGFloat buttonY = redCarpetLabelY + redCarpetLabelHeight + BUTTON_PADDING * 2;
    
    
    _redCarpetLabel = [[UILabel alloc] initWithFrame:CGRectMake(redCarpetLabelX, redCarpetLabelY, redCarpetLabelWidth, redCarpetLabelHeight)];
    _redCarpetLabel.text = @"RED CARPET";
    _redCarpetLabel.font = [UIFont fontWithName:APP_FONT size:TITLE_FONT_SIZE];
    _redCarpetLabel.textColor = [UIColor whiteColor];
    _redCarpetLabel.textAlignment = NSTextAlignmentCenter;
    _redCarpetLabel.adjustsFontSizeToFitWidth = YES;
    _redCarpetLabel.minimumScaleFactor = TITLE_FONT_SIZE/_redCarpetLabel.font.pointSize;
    
    _signInButton = [[UIButton alloc] initWithFrame:CGRectMake(signInButtonX, buttonY, buttonWidth, buttonHeight)];
    [_signInButton setTitle:@"sign in" forState:UIControlStateNormal];
    [_signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signInButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _signInButton.titleLabel.textAlignment = NSTextAlignmentRight;
    _signInButton.titleLabel.font = [UIFont fontWithName:APP_FONT size:BUTTON_FONT_SIZE];
    
    _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(registerButtonX, buttonY, buttonWidth, buttonHeight)];
    [_registerButton setTitle:@"register" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _registerButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    _registerButton.titleLabel.font = [UIFont fontWithName:APP_FONT size:BUTTON_FONT_SIZE];
    
    [self addSubview:_redCarpetLabel];
    [self addSubview:_signInButton];
    [self addSubview:_registerButton];
    
    
    return self;
}

@end

//
//  RCRegisterView.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCRegisterView.h"

@implementation RCRegisterView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    //UI Constants
    CGFloat PADDING = .05 * AVAILABLE_WIDTH;
    CGFloat FONT_SIZE = 24;
    CGFloat TITLE_FONT_SIZE = 36;
    CGFloat BORDER_WIDTH = 2;
    NSString* welcomeMessage = @"Welcome to\nRed Carpet";
    
    //Widths and Heights
    CGFloat textFieldWidth = AVAILABLE_WIDTH - 2 * PADDING;
    CGFloat titleWidth = AVAILABLE_WIDTH - 2 * PADDING;
    CGFloat titleHeight = [welcomeMessage sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:APP_FONT size:TITLE_FONT_SIZE]}].height;
    
    //Positioning
    CGFloat textFieldX = PADDING;
    CGFloat usernameY = AVAILABLE_HEIGHT / 2 - PADDING * 4;
    CGFloat passwordY = usernameY + PADDING * 3;
    CGFloat titleX = PADDING;
    CGFloat titleY = usernameY - titleHeight - PADDING * 2;
    
    //username field
    _userName = [[UITextField alloc] init];
    _userName.font = [UIFont fontWithName:APP_FONT size:FONT_SIZE];
    _userName.textColor = [UIColor whiteColor];
    _userName.frame = CGRectMake(textFieldX, usernameY, textFieldWidth, [_userName sizeThatFits:CGSizeMake(500, 500)].height + BORDER_WIDTH * 3);
    _userName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    _userName.textAlignment = NSTextAlignmentCenter;
    _userName.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.layer.borderColor = [[UIColor blackColor] CGColor];
    _userName.layer.borderWidth = BORDER_WIDTH;
    _userName.keyboardType = UIKeyboardTypeEmailAddress;
    _userName.returnKeyType = UIReturnKeyNext;
    _userName.autocorrectionType = UITextAutocorrectionTypeNo;
    _userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //password field - same with a few adjustments
    _password = [self copytextField:_userName];
    _password.frame = CGRectMake(textFieldX, passwordY, textFieldWidth, _userName.frame.size.height);
    _password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    _password.layer.borderColor = _userName.layer.borderColor;
    _password.layer.borderWidth = _userName.layer.borderWidth;
    _password.secureTextEntry = YES;
    _password.keyboardType = UIKeyboardTypeDefault;
    _password.returnKeyType = UIReturnKeyNext;
    
    //password confirm field
    _confirmPassword = [self copytextField:_password];
    _confirmPassword.frame = CGRectMake(textFieldX, passwordY + PADDING * 3, textFieldWidth, _password.frame.size.height);
    _confirmPassword.returnKeyType = UIReturnKeyGo;
    _confirmPassword.layer.borderColor = _userName.layer.borderColor;
    _confirmPassword.layer.borderWidth = _userName.layer.borderWidth;
    _confirmPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    _confirmPassword.textAlignment = NSTextAlignmentCenter;

    [self addSubview:_userName];
    [self addSubview:_password];
    [self addSubview:_confirmPassword];
    
    //title field
    _title = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleWidth, titleHeight)];
    _title.text = welcomeMessage;
    _title.numberOfLines = 2;
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor = [UIColor whiteColor];
    _title.font = [UIFont fontWithName:APP_FONT size:TITLE_FONT_SIZE];
    
    [self addSubview:_title];
    
    self.backgroundColor = [UIColor RCBackgroundColor];
    
    return self;
}

//deep copy a textfield
- (UITextField *)copytextField:(UITextField *)textField
{
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject: textField];
    UITextField* copy = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    return copy;
}

@end

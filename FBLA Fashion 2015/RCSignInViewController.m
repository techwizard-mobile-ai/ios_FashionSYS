//
//  RCSignInViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCSignInViewController.h"

@implementation RCSignInViewController

- (id)init
{
    self = [super init];
    
    _signInView = [[RCSignInView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT)];
    _signInView.userName.delegate = self;
    _signInView.password.delegate = self;
    
    self.title = @"Sign In";
    self.view = _signInView;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    

}

#pragma mark - UITextField Delegate Methods

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField == _signInView.userName)  //auto bringup the password field if the username field is active
    {
        [textField resignFirstResponder];
        [_signInView.password becomeFirstResponder];
    }
    else if(textField == _signInView.password && _signInView.userName.text.length > 0 && _signInView.password.text.length > 0)  //ensure text is entered in both places, then start the sign in process
    {
        [textField resignFirstResponder];
        NSLog(@"Begin login process");
    }
    
    return YES;
}

@end

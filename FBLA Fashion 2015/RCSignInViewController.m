//
//  RCSignInViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCSignInViewController.h"
#import <Parse/Parse.h>

@implementation RCSignInViewController

- (id)init
{
    self = [super init];
    
    //configure view and set delegates to controller
    _signInView = [[RCSignInView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT)];
    _signInView.userName.delegate = self;
    _signInView.password.delegate = self;
    
    //configure alerts
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    _loginSuccessful = [UIAlertController alertControllerWithTitle:@"Success" message:@"Login Successful" preferredStyle:UIAlertControllerStyleAlert];
    [_loginSuccessful addAction:ok];
    
    _loginFailed = [UIAlertController alertControllerWithTitle:@"Failed" message:@"Login Failed" preferredStyle:UIAlertControllerStyleAlert];
    [_loginFailed addAction:ok];
    
    
    self.title = @"Sign In";  //configure title for navigation controller
    self.view = _signInView;  //set view
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    

}

#pragma mark - UITextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField == _signInView.userName)  //auto bringup the password field if the username field is active
    {
        //TODO: ensure its an email address
        
        [textField resignFirstResponder];
        [_signInView.password becomeFirstResponder];
    }
    else if(textField == _signInView.password && _signInView.userName.text.length > 0 && _signInView.password.text.length > 0)  //ensure text is entered in both places, then start the sign in process
    {
        [textField resignFirstResponder];
        [self signIn];
    }
    
    return YES;
}

-(void)signIn
{
    [PFUser logInWithUsernameInBackground:_signInView.userName.text password:_signInView.password.text block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        if(user)
        {
            [self presentViewController:_loginSuccessful animated:YES completion:nil];
        }
        else
        {
            _loginFailed.message = [error userInfo][@"error"];
            [self presentViewController:_loginFailed animated:YES completion:nil];
        }
    }];
     
}

@end

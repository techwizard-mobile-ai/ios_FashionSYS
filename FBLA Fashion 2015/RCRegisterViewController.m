//
//  RCRegisterViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/24/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCRegisterViewController.h"
#import <Parse/Parse.h>

@implementation RCRegisterViewController

- (id)init
{
    self = [super init];
    
    //create view and set its delegate to the controller
    _registerView = [[RCRegisterView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT)];
    _registerView.userName.delegate = self;
    _registerView.password.delegate = self;
    _registerView.confirmPassword.delegate = self;
    
    //Set up Alerts
    _passwordTooShort = [UIAlertController alertControllerWithTitle:@"Bad Password" message:@"Your password is too short!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [_passwordTooShort addAction:ok];
    
    _passwordsDontMatch = [UIAlertController alertControllerWithTitle:@"Password Mismatch" message:@"Your entered passwords do not match!" preferredStyle:UIAlertControllerStyleAlert];
    [_passwordsDontMatch addAction:ok];
    
    _registrationFailed = [UIAlertController alertControllerWithTitle:@"Failed" message:@"Registration failed. Try again later" preferredStyle:UIAlertControllerStyleAlert];
    [_registrationFailed addAction:ok];
    
    
    self.title = @"Register";  //title for navigation controller
    self.view = _registerView;  //set view
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark - UITextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField == _registerView.userName)  //auto bringup the password field if the username field is active
    {
        //TODO: ensure its an email address
        
        [textField resignFirstResponder];
        [_registerView.password becomeFirstResponder];
    }
    else if(textField == _registerView.password)  //run some checks on password field before moving onto confirmation
    {
        if(_registerView.password.text.length <= 0)
        {
            [self presentViewController:_passwordTooShort animated:YES completion:nil];
        }
        else
        {
            [textField resignFirstResponder];
            [_registerView.confirmPassword becomeFirstResponder];
        }
    }
    else if(textField == _registerView.confirmPassword)  //confirm the passwords match, then begin registration
    {
        
        if(![_registerView.password.text isEqualToString:_registerView.confirmPassword.text])
        {
            [self presentViewController:_passwordsDontMatch animated:YES completion:nil];
        }
        else
        {
            [textField resignFirstResponder];
            [self registerUser];
        }
    }
    
    return YES;
}

#pragma mark - Parse methods

-(void)registerUser
{
    PFUser *user = [PFUser user];  //create new user
    
    //set its fields
    user.username = _registerView.userName.text;
    user.password = _registerView.password.text;
    user.email = _registerView.userName.text;
    
    //sign user up
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(!error)
        {
            [self dismissViewControllerAnimated:NO completion:nil];
            [self.delegate switchToTabBar];
        }
        else  //inform user of what went wrong with their registration
        {
            _registrationFailed.message = [error userInfo][@"error"];
            [self presentViewController:_registrationFailed animated:YES completion:nil];
        }
    }];
}

@end

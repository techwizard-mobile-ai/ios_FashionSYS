//
//  LoginViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/18/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCLoginViewController.h"
#import "RCSignInViewController.h"
#import "RCRegisterViewController.h"

@interface RCLoginViewController ()

@end

@implementation RCLoginViewController

- (id)init
{
    self = [super init];
    
    if (self)
    {
        //configure login view
        RCLoginView* loginView = [[RCLoginView alloc] initWithFrame:self.view.frame];
        [loginView.signInButton addTarget:self action:@selector(signIn:) forControlEvents:UIControlEventTouchUpInside];
        [loginView.registerButton addTarget:self action:@selector(newRegister:) forControlEvents:UIControlEventTouchUpInside];
        loginView.delegate = self;
                
        self.view = loginView;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder //perform controller setup
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        //configure login view
        RCLoginView* loginView = [[RCLoginView alloc] initWithFrame:self.view.frame];
        [loginView.signInButton addTarget:self action:@selector(signIn:) forControlEvents:UIControlEventTouchUpInside];
        [loginView.registerButton addTarget:self action:@selector(newRegister:) forControlEvents:UIControlEventTouchUpInside];
        loginView.delegate = self;
        
        self.view = loginView;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)signIn:(id)sender
{
    NSLog(@"Signing in");
    
    RCSignInViewController* signInController = [[RCSignInViewController alloc] init];
    [self.navigationController pushViewController:signInController animated:YES];
}


- (void)newRegister:(id)sender
{
    RCRegisterViewController* registerController = [[RCRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

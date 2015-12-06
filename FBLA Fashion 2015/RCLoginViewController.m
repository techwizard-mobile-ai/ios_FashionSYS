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

//navigation bar according to which view is present
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

//navigation bar according to which view is present
- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

//present the sign in view controller
- (void)signIn:(id)sender
{    
    RCSignInViewController* signInController = [[RCSignInViewController alloc] init];
    signInController.delegate = self;
    [self.navigationController pushViewController:signInController animated:YES];
}

//present the registration interface
- (void)newRegister:(id)sender
{
    RCRegisterViewController* registerController = [[RCRegisterViewController alloc] init];
    registerController.delegate = self;
    [self.navigationController pushViewController:registerController animated:YES];
}

//switch to the tab bar from the login
- (void)switchToTabBar
{
    [self dismissViewControllerAnimated:NO completion:nil];
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;  //get the app delegate
    
    RCMainTabController* tabController = [[RCMainTabController alloc] init];  //create the tab controller
    appDelegate.window.rootViewController = tabController;  //switch the root view controller
    [appDelegate.window makeKeyAndVisible];  //update
    
    tabController.view.alpha = 0.0;
    
    //animated appearance
    [UIView animateWithDuration:1.5 animations:^{
        tabController.view.alpha = 1.0;
    }];
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

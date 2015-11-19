//
//  LoginViewController.m
//  FBLA Fashion 2015
//
//  Created by Stephen Polcyn on 11/18/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCLoginViewController.h"

@interface RCLoginViewController ()

@end

@implementation RCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //configure login view
    RCLoginView* loginView = [[RCLoginView alloc] initWithFrame:self.view.frame];
    loginView.delegate = self;
    
    self.view = loginView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![PFUser currentUser]) {
        
        
        
    }
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

//
//  MainTabController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCMainTabController.h"

@interface RCMainTabController ()

@end

@implementation RCMainTabController

- (id)init
{
    self = [super init];
    
    //set the view controllers managed by the tab bar
    self.viewControllers = [NSArray arrayWithObjects:[[RCOutfitsController alloc] init], [[RCUploadController alloc] init], [[RCDressCodeController alloc] init], nil];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.opaque = TRUE;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

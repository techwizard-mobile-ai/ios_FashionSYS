//
//  RCCommunityController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCCommunityController.h"

@interface RCCommunityController ()

@end

@implementation RCCommunityController

- (id)init
{
    self = [super init];
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Community" image:[UIImage imageNamed:@"community-icon.png"] tag:1];
    
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

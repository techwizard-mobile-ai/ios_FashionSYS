//
//  RCDressCodeController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCDressCodeController.h"

@interface RCDressCodeController ()

@end

@implementation RCDressCodeController

- (id)init
{
    self = [super init];
    
    //create the tab bar item
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Dress Code" image:[UIImage imageNamed:@"dress-code-icon.png"] tag:1];
    
    //create the dress code view and set it as the active one
    _dressCodeView = [[RCDressCodeView alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT)];
    
    [self.view addSubview:_dressCodeView];
    
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

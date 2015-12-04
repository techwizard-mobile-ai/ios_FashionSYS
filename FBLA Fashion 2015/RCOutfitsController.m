//
//  RCOutfitsControllerViewController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/3/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCOutfitsController.h"

@interface RCOutfitsController ()

@end

@implementation RCOutfitsController

- (id)init
{
    self = [super init];
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Outfits" image:[UIImage imageNamed:@"outfits-icon.png"] tag:1];
    self.title = @"Outfits";
    
    //configure scroll view for images
    _outfits = [[RCOutfitsView alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y + NAVIGATION_BAR_HEIGHT, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - NAVIGATION_BAR_HEIGHT)];
    _outfits.delegate = self;
    
    //prevent user from moving left and right / zooming
    _outfits.imageScrollView.pinchGestureRecognizer.enabled = NO;
    _outfits.imageScrollView.panGestureRecognizer.enabled = NO;
    
    [self.view addSubview:_outfits];
    
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

#pragma mark - OutfitImageDelegate Delegate Methods

- (void)favorite:(id)sender
{
    
}

- (void)comments:(id)sender
{
    
}

- (void)style:(id)sender
{
    
}

- (void)dressCode:(id)sender
{
    
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

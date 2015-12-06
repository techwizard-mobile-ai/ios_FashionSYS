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
    
    
    //configure the refresh button
    _refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y + NAVIGATION_BAR_HEIGHT, AVAILABLE_WIDTH, TAB_BAR_HEIGHT / 2.0)];
    _refreshButton.backgroundColor = [UIColor RCBackgroundColor];
    [_refreshButton setTitle:@"Refresh Images" forState:UIControlStateNormal];
    [_refreshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_refreshButton addTarget:self action:@selector(updateImages) forControlEvents:UIControlEventTouchUpInside];
    [_refreshButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    //configure scroll view for images
    _outfits = [[RCOutfitsView alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y + NAVIGATION_BAR_HEIGHT + _refreshButton.frame.size.height, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT - _refreshButton.frame.size.height)];
    _outfits.delegate = self;
    _outfits.userInteractionEnabled = YES;
    _outfits.delegate = self;

    //add the images stored in Parse
    [self addImages];
    
    //create activity spinner
    _uploadSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_uploadSpinner setCenter:CGPointMake(AVAILABLE_WIDTH / 2.0, self.view.frame.size.height / 2.0)];
    [self.view addSubview:_uploadSpinner];
    
    [self.view addSubview:_outfits];
    [self.view addSubview:_refreshButton];
    
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

- (void)addImages  //retrieves the images off of parse
{
    PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"];  //query to class
    
    [query whereKey:@"imageName" containsString:@"outfit"];  //want the key to contain outfit
    
    //find the set of objects
    [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if (!error)
        {
            //iterate through the objects to get their imageFile property
            for (PFObject* object in objects)
            {
                PFFile* imageFile = object[@"imageFile"];
                
                //download the image specified by the object
                [imageFile getDataInBackgroundWithBlock:^(NSData* imageData, NSError* error) {
                    if(!error)
                    {
                        //convert the image data into a uiimage and add it to the outfits
                        UIImage* image = [UIImage imageWithData:imageData];
                        [_outfits addOutfitWithImage:image delegate:self number:[self extractOutfitNumber:object]];
                    }
                    else
                    {
                        NSLog(@"ERROR: %@", error);
                    }
                }];
            }
        }
        
        else
        {
            NSLog(@"error: %@", error);
        }
    }];
    
}

- (void)updateImages
{
    [_uploadSpinner startAnimating];
    
    int photoDifference = [Parse getCurrentPhotoCount] - [_outfits.outfitImageViews count];
    
    if(photoDifference > 0)
    {
        PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"];
        
        [query whereKey:@"imageName" containsString:@"outfit"];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            for (PFObject* object in objects) {
                
                if([self extractOutfitNumber:object] > [_outfits.outfitImageViews count]) //if the image file name has a number greater than the current amount displayed
                {
                    PFFile* imageFile = object[@"imageFile"];
                    
                    //download the image specified by the object
                    [imageFile getDataInBackgroundWithBlock:^(NSData* imageData, NSError* error) {
                        if(!error)
                        {
                            //convert the image data into a uiimage and add it to the outfits
                            UIImage* image = [UIImage imageWithData:imageData];
                            [_outfits addOutfitWithImage:image delegate:self number:[self extractOutfitNumber:object]];
                        }
                        else
                        {
                            NSLog(@"ERROR: %@", error);
                        }
                    }];
                }
            }
            
            [_uploadSpinner stopAnimating];
            
        }];
    }
    
    _refreshButton.backgroundColor = [UIColor greenColor];
    
    [UIView animateWithDuration:1.0 animations:^{
        _refreshButton.backgroundColor = [UIColor RCBackgroundColor];
    }];
}

- (NSUInteger)extractOutfitNumber:(PFObject*)object
{
    NSString* imageName = object[@"imageName"];
    
    return [[[imageName stringByDeletingPathExtension] stringByReplacingOccurrencesOfString:@"outfit" withString:@""] integerValue];

}

#pragma mark - OutfitImageView Methods

- (void)favorite:(RCOutfitImageView*)sender
{
    NSLog(@"favorite");
}

- (void)comments:(RCOutfitImageView*)sender
{
    NSLog(@"comments");
}

- (void)style:(RCOutfitImageView*)sender
{
    NSLog(@"style");
}

- (void)dressCode:(RCOutfitImageView*)sender
{
    NSLog(@"dresscode");
}

#pragma mark - TabBarDelegate methods

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"tab bar item pressed");
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

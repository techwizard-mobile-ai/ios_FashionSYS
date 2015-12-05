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
    _outfits = [[RCOutfitsView alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y + NAVIGATION_BAR_HEIGHT, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
    _outfits.delegate = self;
    
    //prevent user from moving left and right / zooming
    _outfits.imageScrollView.pinchGestureRecognizer.enabled = NO;
    _outfits.imageScrollView.panGestureRecognizer.enabled = NO;
    _outfits.imageScrollView.scrollEnabled = YES;
    
    [self addSampleImages];
    
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

- (void)addSampleImages  //retrieves the sample images off of parse
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
                        [_outfits addOutfitWithImage:image];
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

- (void)uploadImageToParse:(UIImage*)image named:(NSString*)imageName;
{
    //upload the image to Parse
    NSData* imageData = UIImagePNGRepresentation(image);
    PFFile* imageFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@%@", [imageName stringByDeletingPathExtension], @".png"] data:imageData];
    
    PFObject* userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"imageName"] = [NSString stringWithFormat:@"%@%@", [imageName stringByDeletingPathExtension], @".png"];
    userPhoto[@"imageFile"] = imageFile;
    [userPhoto saveInBackground];
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

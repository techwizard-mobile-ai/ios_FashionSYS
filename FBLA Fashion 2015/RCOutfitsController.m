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
    _refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y, AVAILABLE_WIDTH, TAB_BAR_HEIGHT / 2.0)];
    _refreshButton.backgroundColor = [UIColor RCBackgroundColor];
    [_refreshButton setTitle:@"Refresh Images" forState:UIControlStateNormal];
    [_refreshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_refreshButton addTarget:self action:@selector(updateImages) forControlEvents:UIControlEventTouchUpInside];
    [_refreshButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    //configure scroll view for images
    _outfits = [[RCOutfitsView alloc] initWithFrame:CGRectMake(DEFAULT_X, DEFAULT_Y  + _refreshButton.frame.size.height, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT - _refreshButton.frame.size.height)];
    _outfits.delegate = self;
    _outfits.userInteractionEnabled = YES;

    //add the images stored in Parse
    [self addImages];
    
    //create activity spinner
    _uploadSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_uploadSpinner setCenter:CGPointMake(AVAILABLE_WIDTH / 2.0, self.view.frame.size.height / 2.0)];
    [self.view addSubview:_uploadSpinner];
    
    //add the views to the controller
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
                        [_outfits addOutfitWithImage:image delegate:self number:[self extractOutfitNumber:object] favorites:[[object objectForKey:@"favorites"] integerValue] style:[[object objectForKey:@"style"] integerValue] dressCode:[[object objectForKey:@"dressCode"] integerValue] comments:[[object objectForKey:@"comments"] count]];
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

//check for new images and add them to the views
- (void)updateImages
{
    [_uploadSpinner startAnimating];
    
    int photoDifference = [Parse getCurrentPhotoCount] - [_outfits.outfitImageViews count]; //calculate difference between the number stored in parse and the number displayed
    
    if(photoDifference > 0) //if more in parse, pull them down
    {
        PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"]; //set up the query
        
        [query whereKey:@"imageName" containsString:@"outfit"]; //specialize the query
        
        //pull down the new objects and add them to the view
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
                        [_outfits addOutfitWithImage:image delegate:self number:[self extractOutfitNumber:object] favorites:[[object objectForKey:@"favorites"] integerValue] style:[[object objectForKey:@"style"] integerValue] dressCode:[[object objectForKey:@"dressCode"] integerValue] comments:[[object objectForKey:@"comments"] count]];                        }
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
    
    //show the user that something happened
    _refreshButton.backgroundColor = [UIColor greenColor];
    
    [UIView animateWithDuration:1.0 animations:^{
        _refreshButton.backgroundColor = [UIColor RCBackgroundColor];
    }];
}

//take the outfit number out of the string
- (NSUInteger)extractOutfitNumber:(PFObject*)object
{
    NSString* imageName = object[@"imageName"];
    
    return [[[imageName stringByDeletingPathExtension] stringByReplacingOccurrencesOfString:@"outfit" withString:@""] integerValue];

}

#pragma mark - OutfitImageView Methods

//updates the Parse data and the view with the favorite
- (void)favorite:(RCOutfitImageView*)sender
{    
    PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"];
    [query whereKey:@"imageName" equalTo:[NSString stringWithFormat:@"outfit%lu.jpg", (unsigned long)sender.imageNumber]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
        for (PFObject* object in objects) {
            object[@"favorites"] = @([[object valueForKey:@"favorites"] integerValue] + 1);
            [object saveInBackground];
            sender.favoriteLabel.text = [NSString stringWithFormat:@"%d", [[object objectForKey:@"favorites"] integerValue]];
        }
    }];
}

//allow for comment editing
- (void)comments:(RCOutfitImageView*)sender
{
    //pull down the object for the view
    PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"];
    [query whereKey:@"imageName" equalTo:[NSString stringWithFormat:@"outfit%lu.jpg", (unsigned long)sender.imageNumber]];
    NSArray* resultantObjects = [query findObjects];

    //create a navigation controller in which to present the table view controller
    UINavigationController* navControl = [[UINavigationController alloc] init];
    
    //create controller in which to present the table view
    RCCommentsViewController* commentsController = [[RCCommentsViewController alloc] initWithPFObject:[resultantObjects objectAtIndex:0]];
    commentsController.imageView = sender;
    
    //add the comments controller to the nav controller
    [navControl addChildViewController:commentsController];
    
    //present the controller
    [self presentViewController:navControl animated:YES completion:nil];
}

- (void)style:(RCOutfitImageView*)sender
{
    //prepare the query for the object
    PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"];
    [query whereKey:@"imageName" equalTo:[NSString stringWithFormat:@"outfit%lu.jpg", (unsigned long)sender.imageNumber]];
    
    //get the object and update the UI and the Parse data with the style +1
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
        for (PFObject* object in objects) {
            object[@"style"] = @([[object valueForKey:@"style"] integerValue] + 1);
            [object saveInBackground];
            sender.styleLabel.text = [NSString stringWithFormat:@"%d", [[object objectForKey:@"style"] integerValue]];
        }
    }];
}

- (void)dressCode:(RCOutfitImageView*)sender
{
    //prepare the query for the object
    PFQuery* query = [PFQuery queryWithClassName:@"UserPhoto"];
    [query whereKey:@"imageName" equalTo:[NSString stringWithFormat:@"outfit%lu.jpg", (unsigned long)sender.imageNumber]];
    
    //get the object and update the UI and the Parse data with the dress code +1
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
        for (PFObject* object in objects) {
            object[@"dressCode"] = @([[object valueForKey:@"dressCode"] integerValue] + 1);
            [object saveInBackground];
            sender.dressCodeLabel.text = [NSString stringWithFormat:@"%d", [[object objectForKey:@"dressCode"] integerValue]];
        }
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

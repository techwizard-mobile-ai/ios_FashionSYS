//
//  RCUploadController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCUploadController.h"

@interface RCUploadController ()

@end

@implementation RCUploadController

-(id)init
{
    self = [super init];
    
    //configure the view for uploading
    _uploadView = [[RCUploadView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT)];
    _uploadView.delegate = self;
    
    //set up it's relation with other controllers
    self.title = @"Upload";
    self.tabBarItem.title = @"Upload";
    self.tabBarItem.image = [UIImage imageNamed:@"upload-icon.png"];
    
    //configure success alert if image upload succeeds
    _successAlert = [UIAlertController alertControllerWithTitle:@"Success" message:@"Your image has been uploaded" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [_successAlert addAction:ok];
    
    [self.view addSubview:_uploadView];
    
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

//configures and presents the image picker
- (void)beginImageUploadProcess
{
    UIImagePickerController* controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

//uploads the iamge to parse
- (void)uploadImageToParse:(UIImage*)image named:(NSString*)imageName;
{
    NSData* imageData = UIImageJPEGRepresentation(image, 1.0);  //dump raw JPG data
    
    PFFile* imageFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@%@", [imageName stringByDeletingPathExtension], @".jpg"] data:imageData];  //create the parse file
    
    PFObject* userPhoto = [PFObject objectWithClassName:@"UserPhoto"];  //create parse object
    userPhoto[@"imageName"] = [NSString stringWithFormat:@"%@%@", [imageName stringByDeletingPathExtension], @".jpg"];  //ensure PNG file name
    userPhoto[@"imageFile"] = imageFile;  //set the image file
    
    //start with 0 for all stats
    userPhoto[@"favorites"] = @0;
    userPhoto[@"dressCode"] = @0;
    userPhoto[@"style"] = @0;
    userPhoto[@"comments"] = @0;
    
    //save the image
    [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if(succeeded)
        {
            [Parse incrementPhotoCount];  //increment the number of photos if upload suceeded
            [_uploadSpinner stopAnimating];
            [self presentViewController:_successAlert animated:YES completion:nil];  //let the user know success was achieved
        }
        else
        {
            NSLog(@"Error: %@", error);
        }
    }];
    
    //show activity spinner
    _uploadSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_uploadSpinner setCenter:CGPointMake(AVAILABLE_WIDTH / 2.0, self.view.frame.size.height / 2.0)];
    [self.view addSubview:_uploadSpinner];
    [_uploadSpinner startAnimating];
}

#pragma mark - UIImagePickerController delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage* image = [info valueForKey:UIImagePickerControllerOriginalImage];  //extract the chosen image
    
    [self uploadImageToParse:image named:[NSString stringWithFormat:@"outfit%d.png", [Parse getCurrentPhotoCount] + 1]];  //upload it
    
    [picker dismissViewControllerAnimated:YES completion:nil]; //dismiss the image picker
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

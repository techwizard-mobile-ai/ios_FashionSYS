//
//  RCUploadController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/5/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCUploadController.h"

@interface RCUploadController ()

@end

@implementation RCUploadController

-(id)init
{
    self = [super init];
    
    _uploadView = [[RCUploadView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT)];
    _uploadView.delegate = self;
    
    self.title = @"Upload";
    self.tabBarItem.title = @"Upload";
    self.tabBarItem.image = [UIImage imageNamed:@"upload-icon.png"];
    
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

- (void)beginImageUploadProcess
{
    UIImagePickerController* controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)uploadImageToParse:(UIImage*)image named:(NSString*)imageName;
{
    //upload the image to Parse
    image = [UIImage imageWithImage:image scaledToSize:CGSizeMake(640, 640)];
    NSData* imageData = UIImagePNGRepresentation(image);
    
    PFFile* imageFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@%@", [imageName stringByDeletingPathExtension], @".png"] data:imageData];
    
    PFObject* userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"imageName"] = [NSString stringWithFormat:@"%@%@", [imageName stringByDeletingPathExtension], @".png"];
    userPhoto[@"imageFile"] = imageFile;
    [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(succeeded)
        {
            [Parse incrementPhotoCount];  //increment the number of photos if upload suceeded
        }
        else
        {
            NSLog(@"Error: %@", error);
        }
    }];
}

#pragma mark - UIImagePickerController delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage* image = [info valueForKey:UIImagePickerControllerOriginalImage];  //extract the chosen image
    
    [self uploadImageToParse:image named:[NSString stringWithFormat:@"outfit%d.png", [Parse getCurrentPhotoCount] + 1]];  //upload it
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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

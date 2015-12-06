//
//  RCCommentsViewController.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/5/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCCommentsViewController.h"

@interface RCCommentsViewController ()

@end

@implementation RCCommentsViewController

- (id)initWithPFObject:(PFObject*)object
{
    self = [super init];
    
    _objectData = object;
    
    //configure the table view
    _comments = [NSMutableArray arrayWithArray:[_objectData objectForKey:@"comments"]];
    _commentsView = [[RCCommentsView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT)];
    _commentsView.delegate = self;
    _commentsView.dataSource = self;
    _commentsView.tableFooterView = [[UIView alloc] init]; //prevent display of empty cells
    self.tableView = _commentsView;
    
    //adding and exiting button configuration
    _addCommentButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addComment)];
    _exitButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(quit)];
    
    self.navigationItem.rightBarButtonItem = _addCommentButton;
    self.navigationItem.leftBarButtonItem = _exitButton;
    
    //configure the addcomment alert
    _addCommentController = [UIAlertController alertControllerWithTitle:@"Add Comment" message:@"Your comment: " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* submitAction = [UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_comments addObject:[[_addCommentController textFields] objectAtIndex:0].text];
        
        _objectData[@"comments"] = _comments;
        [_objectData save];
        
        _imageView.commentsLabel.text = [NSString stringWithFormat:@"%d", [_comments count]];
        
        [_commentsView reloadData];
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [_addCommentController addAction:cancelAction];
    [_addCommentController addAction:submitAction];
    
    [_addCommentController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = @"";
        textField.placeholder = @"Comment...";
        textField.delegate = self;
        textField.returnKeyType = UIReturnKeyDone;
    }];
    
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

#pragma mark - UITableViewDelegate Methods

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_comments objectAtIndex:indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

#pragma mark - RCCommentsViewDelegate Methods

-(void)addComment
{
    [self presentViewController:_addCommentController animated:YES completion:nil];
}

-(void)quit
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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

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
    
    _comments = [NSMutableArray arrayWithArray:[_objectData objectForKey:@"comments"]];
    _commentsView = [[RCCommentsView alloc] initWithFrame:CGRectMake(0, DEFAULT_Y, AVAILABLE_WIDTH, AVAILABLE_HEIGHT - TAB_BAR_HEIGHT)];
    _commentsView.delegate = self;
    
    _addCommentButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addComment)];
    _exitButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(quit)];
    
    self.navigationItem.rightBarButtonItem = _addCommentButton;
    self.navigationItem.leftBarButtonItem = _exitButton;
    
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

#pragma mark - UITableViewDelegatemethods

-


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

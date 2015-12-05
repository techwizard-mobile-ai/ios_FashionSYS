//
//  RCOutfitImageView.m
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/4/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import "RCOutfitImageView.h"

@implementation RCOutfitImageView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    //UI Constants
    CGFloat toolBarHeight = TAB_BAR_HEIGHT;
    CGFloat toolBarWidth = AVAILABLE_WIDTH;
    CGFloat toolBarY = frame.size.height - toolBarHeight;
    
    CGFloat favoriteX = 0;
    CGFloat commentsX = favoriteX + toolBarWidth / 4.0;
    CGFloat dressCodeX = commentsX + toolBarWidth / 4.0;
    CGFloat styleX = dressCodeX + toolBarWidth / 4.0;
    CGFloat buttonY = 0;
    
    CGFloat buttonWidth = toolBarWidth / 4.0;
    
    IMAGE_WIDTH = AVAILABLE_WIDTH;
    IMAGE_HEIGHT = AVAILABLE_HEIGHT - NAVIGATION_BAR_HEIGHT - toolBarHeight - TAB_BAR_HEIGHT;
    
    CGFloat imageViewX = DEFAULT_X;
    CGFloat imageViewY = 0;
    CGFloat imageViewWidth = IMAGE_WIDTH;
    CGFloat imageViewHeight = IMAGE_HEIGHT;
    
    //configure button items
    _favoriteButton = [[UIButton alloc] initWithFrame:CGRectMake(favoriteX, buttonY, buttonWidth, toolBarHeight)];
    _commentsButton = [[UIButton alloc] initWithFrame:CGRectMake(commentsX, buttonY, buttonWidth, toolBarHeight)];
    _dressCodeButton = [[UIButton alloc] initWithFrame:CGRectMake(dressCodeX, buttonY, buttonWidth, toolBarHeight)];
    _styleButton = [[UIButton alloc] initWithFrame:CGRectMake(styleX, buttonY, buttonWidth, toolBarHeight)];
    
    [_favoriteButton setTitle:@"Favorite" forState:UIControlStateNormal];
    [_commentsButton setTitle:@"Comments" forState:UIControlStateNormal];
    [_dressCodeButton setTitle:@"Dress Code" forState:UIControlStateNormal];
    [_styleButton setTitle:@"Style" forState:UIControlStateNormal];

    [_favoriteButton setImage:[UIImage imageNamed:FAVORITE_ICON] forState:UIControlStateNormal];
    [_commentsButton setImage:[UIImage imageNamed:COMMENTS_ICON] forState:UIControlStateNormal];
    [_dressCodeButton setImage:[UIImage imageNamed:DRESS_CODE_ICON] forState:UIControlStateNormal];
    [_styleButton setImage:[UIImage imageNamed:STYLE_ICON] forState:UIControlStateNormal];
    
    _favoriteButton.backgroundColor = [UIColor RCBackgroundColor];
    _commentsButton.backgroundColor = [UIColor RCBackgroundColor];
    _dressCodeButton.backgroundColor = [UIColor RCBackgroundColor];
    _styleButton.backgroundColor = [UIColor RCBackgroundColor];
    
    [BorderMaker makeBorder:_favoriteButton side:RIGHT size:1 color:[UIColor whiteColor]];
    [BorderMaker makeBorder:_commentsButton side:RIGHT size:1 color:[UIColor whiteColor]];
    [BorderMaker makeBorder:_dressCodeButton side:RIGHT size:1 color:[UIColor whiteColor]];
    
//    [_favoriteButton centerVertically];
//    [_commentsButton centerVertically];
//    [_dressCodeButton centerVertically];
//    [_styleButton centerVertically];

    _favoriteButton.imageView.contentMode = UIViewContentModeCenter;
    _commentsButton.imageView.contentMode = UIViewContentModeCenter;
    _dressCodeButton.imageView.contentMode = UIViewContentModeCenter;
    _styleButton.imageView.contentMode = UIViewContentModeCenter;

    
    //configure button items & supress warnings for undeclared selector - the delegate has the selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
#pragma clang diagnostic pop
    
    //configure toolbar
    _actionToolBar = [[UITabBar alloc] initWithFrame:CGRectMake(DEFAULT_X, toolBarY, toolBarWidth, toolBarHeight)];
    
    [_actionToolBar addSubview:_favoriteButton];
    [_actionToolBar addSubview:_commentsButton];
    [_actionToolBar addSubview:_dressCodeButton];
    [_actionToolBar addSubview:_styleButton];
    
    [self addSubview:_actionToolBar];  //add the toolbar to the container
    
    //resize text to fit smallest
    _dressCodeButton.titleLabel.font = [self fontSizeForLabel:_dressCodeButton.titleLabel];
    _favoriteButton.titleLabel.font = _dressCodeButton.titleLabel.font;
    _commentsButton.titleLabel.font = _dressCodeButton.titleLabel.font;
    _styleButton.titleLabel.font = _dressCodeButton.titleLabel.font;
    
    //configure imageview
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeight)];
    
    [self addSubview:_imageView];  //add the image to the container
    
    return self;
}

- (UIFont*)fontSizeForLabel:(UILabel*)label;
{
    float largestFontSize = 36;
    while ([label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:largestFontSize]}].width > label.frame.size.width)
    {
        largestFontSize--;
    }
    
    return [UIFont systemFontOfSize:largestFontSize];
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = [UIImage imageWithImage:image scaledToSize:CGSizeMake(IMAGE_WIDTH, IMAGE_HEIGHT)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

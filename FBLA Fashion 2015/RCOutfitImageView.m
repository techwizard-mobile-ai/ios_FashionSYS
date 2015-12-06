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
    
    self.userInteractionEnabled = YES;
    
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
    
    CGFloat statsToolBarHeight = toolBarHeight / 2.0;
    CGFloat statsToolBarWidth = toolBarWidth;
    
    IMAGE_WIDTH = frame.size.width;
    IMAGE_HEIGHT = frame.size.height - toolBarHeight - statsToolBarHeight;
    
    CGFloat imageViewX = DEFAULT_X;
    CGFloat imageViewY = 0;
    CGFloat imageViewWidth = IMAGE_WIDTH;
    CGFloat imageViewHeight = IMAGE_HEIGHT;
    
    CGFloat statsToolBarX = 0;
    CGFloat statsToolBarY = IMAGE_HEIGHT;
    
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

    _favoriteButton.imageView.contentMode = UIViewContentModeCenter;
    _commentsButton.imageView.contentMode = UIViewContentModeCenter;
    _dressCodeButton.imageView.contentMode = UIViewContentModeCenter;
    _styleButton.imageView.contentMode = UIViewContentModeCenter;
    
    [_favoriteButton addTarget:self action:@selector(favoriteTapped) forControlEvents:UIControlEventTouchUpInside];
    [_commentsButton addTarget:self action:@selector(commentsTapped) forControlEvents:UIControlEventTouchUpInside];
    [_dressCodeButton addTarget:self action:@selector(dressCodeTapped) forControlEvents:UIControlEventTouchUpInside];
    [_styleButton addTarget:self action:@selector(styleTapped) forControlEvents:UIControlEventTouchUpInside];
    
    //configure toolbar
    _actionToolBar = [[UIView alloc] initWithFrame:CGRectMake(DEFAULT_X, toolBarY, toolBarWidth, toolBarHeight)];
    _actionToolBar.userInteractionEnabled = YES;
    
    [_actionToolBar addSubview:_favoriteButton];
    [_actionToolBar addSubview:_commentsButton];
    [_actionToolBar addSubview:_dressCodeButton];
    [_actionToolBar addSubview:_styleButton];
    
    _favoriteButton.userInteractionEnabled = YES;
    _commentsButton.userInteractionEnabled = YES;
    _dressCodeButton.userInteractionEnabled = YES;
    _styleButton.userInteractionEnabled = YES;
    
    //resize text to fit smallest
    _dressCodeButton.titleLabel.font = [self fontSizeForLabel:_dressCodeButton.titleLabel];
    _favoriteButton.titleLabel.font = _dressCodeButton.titleLabel.font;
    _commentsButton.titleLabel.font = _dressCodeButton.titleLabel.font;
    _styleButton.titleLabel.font = _dressCodeButton.titleLabel.font;
    
    //configure imageview
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeight)];
    _imageView.userInteractionEnabled = YES;
    
    //configure stats tool bar
    _favoriteLabel = [self statsLabelFactory:CGRectMake(statsToolBarX + buttonWidth * 0, statsToolBarY, buttonWidth, statsToolBarHeight)];
    _commentsLabel = [self statsLabelFactory:CGRectMake(statsToolBarX + buttonWidth * 1, statsToolBarY, buttonWidth, statsToolBarHeight)];
    _dressCodeLabel = [self statsLabelFactory:CGRectMake(statsToolBarX + buttonWidth * 2, statsToolBarY, buttonWidth, statsToolBarHeight)];
    _styleLabel = [self statsLabelFactory:CGRectMake(statsToolBarX + buttonWidth * 3, statsToolBarY, buttonWidth, statsToolBarHeight)];

    [_favoriteLabel setText:@"0"];
    
    [self addSubview:_favoriteLabel];
    [self addSubview:_commentsLabel];
    [self addSubview:_dressCodeLabel];
    [self addSubview:_styleLabel];
    
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

- (UILabel*)statsLabelFactory:(CGRect)frame
{
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    
    label.backgroundColor = [UIColor RCBackgroundColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 1;
    label.text = @"0";
    label.adjustsFontSizeToFitWidth = YES;
    
    return label;
}

- (void)setImage:(UIImage *)image  //changes and scales the image to the appropriate size
{
    self.imageView.image = [UIImage imageWithImage:image scaledToSize:CGSizeMake(IMAGE_WIDTH, IMAGE_HEIGHT)];
}

- (void)favoriteTapped
{
    [self.delegate favorite:self];
}

- (void)commentsTapped
{
    [self.delegate comments:self];
}

- (void)dressCodeTapped
{
    [self.delegate dressCode:self];
}

- (void)styleTapped
{
    [self.delegate style:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  RCUploadView.h
//  Red Carpet
//
//  Created by Stephen Polcyn on 12/1/15.
//  Copyright © 2015 SPYN Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@protocol RCUploadImageProtocol <NSObject>

@required
- (void)beginImageUploadProcess;

@end

@interface RCUploadView : UIView

@property UIButton* uploadButton;
@property (nonatomic, weak) id<RCUploadImageProtocol> delegate;

@end

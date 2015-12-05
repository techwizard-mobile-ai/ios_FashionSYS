//
//  Created by Stephen Polcyn
//  Copyright (c) 2014 Stephen Polcyn. All rights reserved.
//

#import "BorderMaker.h"

@implementation BorderMaker

+ (void)makeBorder:(UIView *)viewToBorder side:(Side)side size:(NSUInteger)size color:(UIColor *)color
{
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = color;
    
    switch (side) {
        case TOP:
            line.frame = CGRectMake(0, 0, viewToBorder.frame.size.width, size);
            break;
        case BOTTOM:
            line.frame = CGRectMake(0, viewToBorder.frame.size.height - size, viewToBorder.frame.size.width, size);
            break;
        case RIGHT:
            line.frame = CGRectMake(viewToBorder.frame.size.width - size, 0, size, viewToBorder.frame.size.height);
            break;
        case LEFT:
            line.frame = CGRectMake(0, 0, size, viewToBorder.frame.size.height);
            break;
        default:
            break;
    }
    
    [viewToBorder addSubview:line];
}

@end

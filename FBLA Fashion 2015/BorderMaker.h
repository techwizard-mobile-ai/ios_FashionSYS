
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, Side) {
    RIGHT,
    LEFT,
    TOP,
    BOTTOM
};

@interface BorderMaker : NSObject

/**
 Makes borders on different sides, in different colors and sizes
 */
+ (void)makeBorder:(UIView*)viewToBorder side:(Side)side size:(NSUInteger)size color:(UIColor*)color;


@end

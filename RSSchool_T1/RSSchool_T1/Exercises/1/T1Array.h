#import <Foundation/Foundation.h>

@interface T1Array : NSObject

- (NSArray *)convertToHappy:(NSArray *)sadArray;
- (BOOL) isHappyNumber:(NSNumber*) it WithLeft:(NSNumber*) left andRight:(NSNumber*) right;
- (BOOL) isNotHappyArray:(NSArray*) array;
@end

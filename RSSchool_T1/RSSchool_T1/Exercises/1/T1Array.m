#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if ([sadArray count] == 0)
        return sadArray;
    
    NSMutableArray * returnArray = [[NSMutableArray alloc] init];
    
    returnArray = [self getHappyArrayFrom:sadArray];
    
    while ([self isNotHappyArray:returnArray]) {
        returnArray = [self getHappyArrayFrom:returnArray];
    }
    
    return returnArray;    
}

-(BOOL) isHappyNumber:(NSNumber*) it WithLeft:(NSNumber*) left andRight:(NSNumber*) right {
    if ([left intValue] + [right intValue] > [it intValue]) {
        return YES;
    }
    
    return NO;
}

-(BOOL) isNotHappyArray:(NSArray*) array {
    for(int i = 1; i < [array count] - 1; i++) {
        if(![self isHappyNumber:[array objectAtIndex: i]
                       WithLeft:[array objectAtIndex: i - 1]
                       andRight:[array objectAtIndex: i + 1]]) {
            return YES;
        }
    }
    
    return NO;
}

-(NSMutableArray*) getHappyArrayFrom:(NSArray*) array {
    NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [array count]; i++) {
        if (i == 0 || i == [array count] - 1){
            [mutableArray addObject:[array objectAtIndex: i]];
            continue;
        } else if(        [self isHappyNumber:[array objectAtIndex: i]
                                     WithLeft:[array objectAtIndex: i - 1]
                                     andRight:[array objectAtIndex: i + 1]]) {
            [mutableArray addObject:[array objectAtIndex: i]];
        }
    }
    
    return mutableArray;
}

@end

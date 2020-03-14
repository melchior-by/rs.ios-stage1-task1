#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray *returnArray = [NSMutableArray array];
    NSNumber *sumOfArray = [array valueForKeyPath: @"@sum.self"];
    
    for(int i = 0; i< [array count]; i++) {
        NSNumber *it = [array objectAtIndex: i];
        [returnArray addObject:@([sumOfArray integerValue] - [it integerValue])];
    }
    
    [returnArray sortUsingSelector:@selector(compare:)];
    
    unsigned long count = [array count];
    NSNumber *min = [returnArray objectAtIndex:0];
    NSNumber *max = [returnArray objectAtIndex:count - 1];
    
    return @[min, max];    
}

@end

#import "BillCounter.h"

@implementation BillCounter

- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSString *bonAppetit = @"Bon Appetit";
    NSNumber *sumOfArray = [bill valueForKeyPath: @"@sum.self"];
    
    if (!index) {
        if (sumOfArray == [NSNumber numberWithInt:[sum intValue] * 2]) {
            return bonAppetit;
        }
    } else {
        NSNumber *minusValue = [bill objectAtIndex:index];
        sumOfArray = [NSNumber numberWithInt:([sumOfArray intValue] - [minusValue intValue])];
        if (sumOfArray == [NSNumber numberWithInt:[sum intValue] * 2]) {
            return bonAppetit;
        } else {
            NSNumber *rightCharge = [NSNumber numberWithInt:([sumOfArray intValue] / 2)];
            if ([sum intValue] > [rightCharge intValue]) {
                return [NSString stringWithFormat:@"%d",
                        [sum intValue] - [rightCharge intValue]];
            }
        }
    }
    
    return bonAppetit;    
}

@end

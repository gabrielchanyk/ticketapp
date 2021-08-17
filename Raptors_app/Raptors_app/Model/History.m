//
//  History.m
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import "History.h"

@implementation History
- (instancetype)initWith: (NSString*)name andPrice:(double)price andQnt:(int)qnt andDate:(NSString*)date
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.price = price;
        self.qnt = qnt;
        self.date = date;
    }
    return self;
}@end

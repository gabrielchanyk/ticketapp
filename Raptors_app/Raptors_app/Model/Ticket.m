//
//  Ticket.m
//  Raptors_app
//
//  Created by user196869 on 6/22/21.
//

#import "Ticket.h"

@implementation Ticket
- (instancetype)initWith: (NSString*)name andPrice:(double)price andQnt:(int)qnt
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.price = price;
        self.qnt = qnt;
    }
    return self;
}
@end

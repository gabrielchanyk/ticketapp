//
//  Data.m
//  Raptors_app
//
//  Created by user196869 on 6/22/21.
//

#import "Data.h"
#import "Ticket.h"
#import "History.h"

@implementation Data
-(NSMutableArray*)listOfTickets
{
    if(_listOfTickets == nil)
    {
        //added this way because eventually this info will be taken from a database, this makes more sense
        Ticket *balLvl = [[Ticket alloc]initWith:@"Balcony" andPrice:300 andQnt:21];
        Ticket *loLvl = [[Ticket alloc]initWith:@"Lower Level" andPrice:500 andQnt:30];
        Ticket *court = [[Ticket alloc]initWith:@"Courtside" andPrice:1000 andQnt:8];
        _listOfTickets = [[NSMutableArray alloc]initWithObjects: balLvl, loLvl, court,  nil];
    }
    return _listOfTickets;
}

-(NSMutableArray*)purchaseHistory
{
    if(_purchaseHistory == nil)
    {
        _purchaseHistory = [[NSMutableArray alloc]init];
    }
    return _purchaseHistory;
}

-(bool)buyAtIndex:(int)index andQnt:(int)qnt
{
    Ticket *tickInfo = [self.listOfTickets objectAtIndex:index];
    if (qnt <= tickInfo.qnt)
    {
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEEE MMMM d, yyyy h:mm:ss a"];
        NSString *timeString = [formatter stringFromDate:date];
        tickInfo.qnt = tickInfo.qnt - qnt;
        double total = qnt * tickInfo.price;
        History *purchase = [[History alloc]initWith:tickInfo.name andPrice:total andQnt:qnt andDate:timeString];
        [self.purchaseHistory addObject:purchase];
        return true;
    }
    else
    {
        return false;
    }
}

-(void)restockAtIndex:(int)index andQnt:(int)qnt
{
    Ticket *tickInfo = [self.listOfTickets objectAtIndex:index];
    tickInfo.qnt = tickInfo.qnt + qnt;
}

@end

//
//  Data.h
//  Raptors_app
//
//  Created by user196869 on 6/22/21.
// class is used for ticket and history data
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
@property(nonatomic)NSMutableArray *listOfTickets;
@property(nonatomic)NSMutableArray *purchaseHistory;
-(bool)buyAtIndex:(int)index andQnt:(int)qnt;
-(void)restockAtIndex:(int)index andQnt:(int)qnt;
@end

NS_ASSUME_NONNULL_END

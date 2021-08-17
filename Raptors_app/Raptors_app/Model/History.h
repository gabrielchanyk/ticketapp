//
//  History.h
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import "Ticket.h"

NS_ASSUME_NONNULL_BEGIN

@interface History : Ticket
@property(nonatomic)NSString *date;
- (instancetype)initWith:(NSString*)name andPrice:(double)price andQnt:(int)qnt andDate:(NSString*)date;
@end

NS_ASSUME_NONNULL_END

//
//  Ticket.h
//  Raptors_app
//
//  Created by user196869 on 6/22/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ticket : NSObject
@property(nonatomic)NSString *name;
@property(nonatomic)double price;
@property(nonatomic)int qnt;
- (instancetype)initWith: (NSString*)name andPrice:(double)price andQnt:(int)qnt;
@end

NS_ASSUME_NONNULL_END

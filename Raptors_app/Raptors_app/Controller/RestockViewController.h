//
//  RestockViewController.h
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import <UIKit/UIKit.h>
#import "Data.h"

NS_ASSUME_NONNULL_BEGIN
//create contract between objects to pass info between them
@protocol RestockVCdelegate
-(void)restockVCdidFinishWith:(Data*)tickData;
@end

@interface RestockViewController : UIViewController
//delegate is used to pass any object, it is id because we dont know what the object could be
@property(nonatomic)id<RestockVCdelegate>restockDelegate;
@property(nonatomic)Data *ticketData;
@end

NS_ASSUME_NONNULL_END

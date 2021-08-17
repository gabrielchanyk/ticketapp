//
//  ManagerViewController.h
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import <UIKit/UIKit.h>
#import "Data.h"
#import "RestockViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagerViewController : UIViewController
@property(nonatomic)Data *tickData;
@property(nonatomic)id<RestockVCdelegate>restockDelegate;
@end

NS_ASSUME_NONNULL_END

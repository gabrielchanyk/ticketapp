//
//  PurchaseInfoViewController.m
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import "PurchaseInfoViewController.h"

@interface PurchaseInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *itemDis;
@property (weak, nonatomic) IBOutlet UILabel *qntDis;
@property (weak, nonatomic) IBOutlet UILabel *totalDis;
@property (weak, nonatomic) IBOutlet UILabel *dateDis;

@end

@implementation PurchaseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemDis.text = self.purchInfo.name;
    self.qntDis.text = [NSString stringWithFormat:@"%d",self.purchInfo.qnt];
    self.totalDis.text = [NSString stringWithFormat:@"$ %.02f",self.purchInfo.price];
    self.dateDis.text = self.purchInfo.date;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

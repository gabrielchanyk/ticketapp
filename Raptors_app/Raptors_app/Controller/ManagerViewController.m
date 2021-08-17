//
//  ManagerViewController.m
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import "ManagerViewController.h"
#import "HistoryViewController.h"
#import "RestockViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Login];
}

- (void)Login
{
    UIAlertController *login = [UIAlertController alertControllerWithTitle:@"Login"
                                   message:@"Enter password: "
                                   preferredStyle:UIAlertControllerStyleAlert];
    [login addTextFieldWithConfigurationHandler:^(UITextField *pass)
     {
        pass.placeholder = @"password";
        pass.clearButtonMode = UITextFieldViewModeWhileEditing;
        pass.secureTextEntry = true;
    }
     ];
    
    //ok button
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        UITextField *password = login.textFields[0];
        if (![password.text  isEqual: @"123"])
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    [login addAction:ok];
    [self presentViewController:login animated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"history"])
    {
        HistoryViewController *histVC = (HistoryViewController*)segue.destinationViewController;
        histVC.purchaseHistory = self.tickData.purchaseHistory;
    }
    else if ([segue.identifier isEqualToString:@"restock"])
    {
        RestockViewController *restVC = (RestockViewController*)segue.destinationViewController;
        restVC.ticketData = self.tickData;
        restVC.restockDelegate = self.restockDelegate;
    }
}


@end

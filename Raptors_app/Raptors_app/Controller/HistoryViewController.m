//
//  HistoryViewController.m
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import "HistoryViewController.h"
#import "History.h"
#import "PurchaseInfoViewController.h"

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *histTV;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.purchaseHistory.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *histCell =[tableView dequeueReusableCellWithIdentifier:@"histCell"];
    History *purHist = [self.purchaseHistory objectAtIndex:indexPath.row];
    histCell.textLabel.text = purHist.name;
    histCell.detailTextLabel.text = [NSString stringWithFormat:@"%d",purHist.qnt];
    return histCell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *selectedIndex = [self.histTV indexPathForSelectedRow];
    History *selectedPurch = [self.purchaseHistory objectAtIndex:selectedIndex.row];
    
    PurchaseInfoViewController *pVC = (PurchaseInfoViewController*)[segue destinationViewController];
    pVC.purchInfo = selectedPurch;
    
}


@end

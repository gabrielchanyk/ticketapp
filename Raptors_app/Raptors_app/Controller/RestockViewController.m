//
//  RestockViewController.m
//  Raptors_app
//
//  Created by user196869 on 6/23/21.
//

#import "RestockViewController.h"
#import "Ticket.h"

@interface RestockViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *txtRestock;
@property (weak, nonatomic) IBOutlet UIPickerView *tickInfoPick;
@property (nonatomic)Ticket *selectedTick; //holds ticket from pickerview
@property (nonatomic)int selectedRow; //holds row
@end

@implementation RestockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //limit to only use numbers on keyboard
    self.txtRestock.keyboardType = UIKeyboardTypeNumberPad;
}
//Pickerview
//#of component
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//# of rows
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.ticketData.listOfTickets.count;
}
//print ticket info onto pickerview
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Ticket *ticketInfo = [self.ticketData.listOfTickets objectAtIndex:row];
    return [NSString stringWithFormat:@"%@ $ %.02f Seats: %d", ticketInfo.name, ticketInfo.price, ticketInfo.qnt];
}

//when user selects row in pickerview
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedTick = [self.ticketData.listOfTickets objectAtIndex:row];
    self.selectedRow = (int)row;
    //set title to selected ticket name
    self.title = self.selectedTick.name;
    
}
- (IBAction)okPressed:(UIButton *)sender {
    //restock
    NSString *qntValue = self.txtRestock.text;
    [self.ticketData restockAtIndex:self.selectedRow andQnt:(int)qntValue.integerValue];
    //set delegate for main controller
    [self.restockDelegate restockVCdidFinishWith:self.ticketData];
    [self.tickInfoPick reloadAllComponents];
}

//clear textbox
- (IBAction)clearPressed:(UIButton *)sender {
    self.txtRestock.text = @"";
}

//go back to main
- (IBAction)backPressed:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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

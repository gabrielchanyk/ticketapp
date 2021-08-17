//
//  ViewController.m
//  Raptors_app
//
//  Created by user196869 on 6/22/21.
//

#import "ViewController.h"
#import "ManagerViewController.h"
#import "RestockViewController.h"
#import "Data.h"
#import "Ticket.h"

// conform to picker view protocol
@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, RestockVCdelegate>
@property (weak, nonatomic) IBOutlet UILabel *numDisplay;
@property (weak, nonatomic) IBOutlet UILabel *typeDisplay;
@property (weak, nonatomic) IBOutlet UILabel *totalDisplay;
@property (weak, nonatomic) IBOutlet UIPickerView *tickInfoPick;
@property (weak, nonatomic) IBOutlet UILabel *noticeDisplay;
@property BOOL isNewDigit;
@property (nonatomic)Data *ticketData; //holds ticket data for info and history
@property (nonatomic)Ticket *selectedTick; //holds ticket from pickerview
@property (nonatomic)int selectedRow; //holds row
@property (nonatomic)double total;
@end
 
@implementation ViewController
//Lazy load data
-(Data*)ticketData{
    if (_ticketData == nil)
    {
        _ticketData = [[Data alloc]init];
    }
    return _ticketData;
}

-(Ticket*)selectedTick{
    if (_selectedTick == nil)
    {
        _selectedTick = [[Ticket alloc]init];
    }
    return _selectedTick;
}
//update total label not working
- (void) updateDis{
    NSString *qntValue = self.numDisplay.text;
    self.total = self.selectedTick.price * qntValue.integerValue;
    self.totalDisplay.text = [NSString stringWithFormat: @"$ %.2f", self.total];
    self.typeDisplay.text = self.selectedTick.name;
}
- (void) resetDis{
    self.numDisplay.text = @"0";
    self.totalDisplay.text = @"$ 0.00";
    self.isNewDigit = true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //ticket is new when loaded
    self.isNewDigit = true;
    self.selectedTick = [self.ticketData.listOfTickets objectAtIndex:0];
}
//receiving data from restock controller through delegation
-(void)restockVCdidFinishWith:(Data *)tickData
{
    self.ticketData = tickData;
    [self.tickInfoPick reloadAllComponents];
    [self resetDis];
    self.noticeDisplay.text = @"";
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

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedTick = [self.ticketData.listOfTickets objectAtIndex:row];
    self.selectedRow = (int)row;
    [self updateDis];
    self.noticeDisplay.text = @"";
}

//button presses to print to title
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digitBtnTitle = sender.currentTitle;
    if(self.isNewDigit)
    {
    self.numDisplay.text = digitBtnTitle;
    self.isNewDigit = NO;
    }
    else
    {
        self.numDisplay.text = [NSString stringWithFormat:@"%@%@",self.numDisplay.text, digitBtnTitle];
    }
    [self updateDis];
}

- (IBAction)buyPressed:(UIButton *)sender {
    
    NSString *qntValue = self.numDisplay.text;
    if (qntValue.integerValue > 0)
    {
        bool purchase = [self.ticketData buyAtIndex:self.selectedRow andQnt:(int)qntValue.integerValue];
        if (purchase)
        {
            self.totalDisplay.text = [NSString stringWithFormat: @"$ %.2f", self.total];
            self.selectedTick = [self.ticketData.listOfTickets objectAtIndex:self.selectedRow];
            self.typeDisplay.text = self.selectedTick.name;
            [self.tickInfoPick reloadAllComponents];
            self.noticeDisplay.text = @"Purchase Successful";
        }
        else
        {
            self.noticeDisplay.text = @"No stock.";
        }
    }
    else
    {
        self.noticeDisplay.text = @"Please enter a quantity.";
    }
    [self resetDis];
    
}
- (IBAction)clearPressed:(UIButton *)sender {
    [self resetDis];
    self.noticeDisplay.text = @"";
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ManagerViewController *ManagerVC = (ManagerViewController*)[segue destinationViewController];
    ManagerVC.tickData = self.ticketData;
    ManagerVC.restockDelegate = self;
}


@end

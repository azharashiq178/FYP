//
//  SchedulerViewController.m
//  FYP
//
//  Created by apple on 11/18/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SchedulerViewController.h"
#import "SchedulerCollectionViewCell.h"
@import AFNetworking;

@interface SchedulerViewController ()

@end

@implementation SchedulerViewController
NSArray *data;
NSMutableArray *locationsFromPicker;
NSMutableArray *timeFromPicker;
NSMutableArray *timeFromPicker1;
//
NSInteger *checkPreviousSelection = nil;
NSMutableArray *timeVar;
int indexNum=0;
int flag = 0;
bool firstTextLine = false;
bool secondTextLine = false;
bool thirdTextLine = false;
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.pickerText addTarget:@selector(changeToPicker:) action:nil forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view.
    timeVar = [[NSMutableArray alloc] initWithObjects:@"12 PM",@"1 PM",@"2 PM",@"3 PM",@"4 PM", nil];
    locationsFromPicker = [[NSMutableArray alloc] init];
    timeFromPicker = [[NSMutableArray alloc] init];
    timeFromPicker1 = [[NSMutableArray alloc] init];
    data = [[NSArray alloc] initWithObjects:@"MON",@"TUE",@"WED",@"THU",@"FRI",@"SAT",@"SUN", nil];
    UIView *bg2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.Day.bounds.size.height-1, self.Day.bounds.size.width, 1.)];
    [bg2 setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [bg2 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [bg2 setBackgroundColor:[UIColor grayColor]];
    [self.Day addSubview:bg2];
    [self.navigationItem.backBarButtonItem setTitle:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"%@",_name);
    [self postData];
//    for(int i = 0;i<[locationsFromPicker count];i++){
//        UITextField *tmp = [locationsFromPicker objectAtIndex:i];
//        NSString *tmp1 = tmp.text;
//        NSLog(@"%@",tmp1);
//    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SchedulerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.Label.text = [data objectAtIndex:indexPath.row];
    if(indexPath.row == 0){
        cell.line.image =[UIImage imageNamed:@"line"];
        NSLog(@"Here");
    }
//    if(indexPath.row == 0 && flag == 0){
//        cell.line.image =[UIImage imageNamed:@"line"];
//        flag = 1;
//    }
//    else if(indexPath.row == 0 && flag == 1){
//        NSLog(@"here");
//        cell.line.image = nil;
////        flag = 2;
//    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    SchedulerCollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.line.image = nil;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    [collectionView reloadData];
    SchedulerCollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    SchedulerCollectionViewCell *cell1 = (SchedulerViewController *)[collectionView cellForItemAtIndexPath:0];
//    if(cell1.line != nil){
//        NSLog(@"Here");
//        cell1.line.image = nil;
//    }
    SchedulerCollectionViewCell *cell1 = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:0];
//    if(cell1.line){
//        NSLog(@"Got it");
//    }
    cell.line.image = [UIImage imageNamed:@"line"];
    
    NSString *selectedDay = [data objectAtIndex:indexPath.row];
    if([selectedDay isEqualToString:@"MON"]){
        self.Day.text = @"MONDAY";
    }
    else if([selectedDay isEqualToString:@"TUE"]){
        self.Day.text = @"TUESDAY";
    }
    else if([selectedDay isEqualToString:@"WED"]){
        self.Day.text = @"WEDNESDAY";
    }
    else if([selectedDay isEqualToString:@"THU"]){
        self.Day.text = @"THURSDAY";
    }
    else if([selectedDay isEqualToString:@"FRI"]){
        self.Day.text = @"FRIDAY";
    }
    else if([selectedDay isEqualToString:@"SAT"]){
        self.Day.text = @"SATURDAY";
    }
    else if([selectedDay isEqualToString:@"SUN"]){
        self.Day.text = @"SUNDAY";
    }





        
//    NSLog(@"i am here");
//    SchedulerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    cell.line.image = [UIImage imageNamed:@"line"];
    //    NSLog(@"%@",[categoryNames objectAtIndex:indexPath.row]);
}
#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

//- (IBAction)showSideBar:(id)sender {
//    _sideBarButton.target = self.revealViewController;
//    _sideBarButton.action = @selector(revealToggle:);
//    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
//}

- (IBAction)addTime:(id)sender {
}
- (IBAction)changePosition:(id)sender {
    if(self.addButton.frame.origin.y>self.scheduleView.frame.size.height-100){
        [self.addButton setEnabled:NO];
    }
    [self insertAddress];
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(firstTextLine == true){
        return [_address count];
    }
    else if(secondTextLine == true){
        return [timeVar count];
    }
    else if(thirdTextLine == true){
        return [timeVar count];
    }
    return 0;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(firstTextLine == true){
        NSString *title;
        title=[_address objectAtIndex:row];
        return title;
    }
    else if(secondTextLine == true){
        NSString *title;
        title=[timeVar objectAtIndex:row];
        return title;
    }
    else if(thirdTextLine == true){
        NSString *title;
        title=[timeVar objectAtIndex:row];
        return title;
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(firstTextLine == true){
        UITextField *test = [locationsFromPicker objectAtIndex:indexNum];
        test.text = [_address objectAtIndex:row];
    }
    else if(secondTextLine == true){
        UITextField *test = [timeFromPicker objectAtIndex:indexNum];
        test.text = [timeVar objectAtIndex:row];
        
    }
    else if(thirdTextLine == true){
        UITextField *test = [timeFromPicker1 objectAtIndex:indexNum];
        test.text = [timeVar objectAtIndex:row];
        
    }
}
//- (IBAction)changeToPicker:(id)sender {
//    UIPickerView *picker = [[UIPickerView alloc] init];
//    self.pickerText.inputView = picker;
//    
//    if(self.pickerText.isEnabled){
//        [self.pickerText setEnabled:NO];
//    }
//    else{
//        [self.pickerText setEnabled:YES];
//    }
//}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if([locationsFromPicker containsObject:textField]){
        for(int i =0 ;i<[locationsFromPicker count];i++){
            if([textField isEqual:[locationsFromPicker objectAtIndex:i]]){
                indexNum = i;
            }
        }
        firstTextLine = true;
        secondTextLine = false;
        
    }
    else if([timeFromPicker containsObject:textField]){
        for(int i =0 ;i<[timeFromPicker count];i++){
            if([textField isEqual:[timeFromPicker objectAtIndex:i]]){
                indexNum = i;
            }
        }
        firstTextLine = false;
        secondTextLine = true;
        
    }
    else if([timeFromPicker1 containsObject:textField]){
        for(int i =0 ;i<[timeFromPicker1 count];i++){
            if([textField isEqual:[timeFromPicker1 objectAtIndex:i]]){
                indexNum = i;
            }
        }
        firstTextLine = false;
        secondTextLine = false;
        thirdTextLine = true;
    }
}
-(void)insertAddress{
    UITextField *sample = [[UITextField alloc] init];
    
    sample.frame = CGRectMake(self.addButton.frame.origin.x, self.addButton.frame.origin.y, self.addButton.frame.size.width-85, self.addButton.frame.size.height);
    self.addButton.frame = CGRectMake(self.addButton.frame.origin.x, self.addButton.frame.origin.y+35, self.addButton.frame.size.width, self.addButton.frame.size.height);
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, sample.bounds.size.height-1, sample.bounds.size.width, 1.)];
    [bg setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [bg setTranslatesAutoresizingMaskIntoConstraints:YES];
    [bg setBackgroundColor:[UIColor blackColor]];
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    sample.delegate = self;
    sample.inputView = picker;
    //    [sample setUserInteractionEnabled:NO];
    [sample addSubview:bg];
    [sample setPlaceholder:@"Location"];
    [sample setAdjustsFontSizeToFitWidth:YES];
    [sample setMinimumFontSize:8];
    [self.scheduleView addSubview:sample];
    [locationsFromPicker addObject:sample];
    
    [self insertTime:sample];
    

}
//-(void)insertTime:(UITextField *)temp{
//    UITextField *sample = [[UITextField alloc] init];
//    sample.frame = CGRectMake(temp.frame.origin.x+10, temp.frame.origin.y, temp.frame.size.width-85, temp.frame.size.height);
//    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, sample.bounds.size.height-1, sample.bounds.size.width, 1.)];
//    [bg setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
//    [bg setTranslatesAutoresizingMaskIntoConstraints:YES];
//    [bg setBackgroundColor:[UIColor blackColor]];
//    
//    UIPickerView *picker = [[UIPickerView alloc] init];
//    picker.delegate = self;
//    picker.dataSource = self;
//    sample.delegate = self;
//    sample.inputView = picker;
//    //    [sample setUserInteractionEnabled:NO];
//    [sample addSubview:bg];
//    [self.scheduleView addSubview:sample];
//    [locationsFromPicker addObject:sample];
//}
-(void)insertTime:(UITextField *)sample{
    UIView *bg1 = [[UIView alloc] initWithFrame:CGRectMake(0, sample.bounds.size.height-1, sample.bounds.size.width, 1.)];
    [bg1 setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [bg1 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [bg1 setBackgroundColor:[UIColor blackColor]];
    
    UITextField *sample1 = [[UITextField alloc] init];
    sample1.frame = CGRectMake(sample.frame.origin.x+100, sample.frame.origin.y, (sample.frame.size.width-20), sample.frame.size.height);
    sample1.delegate = self;
    [sample1 addSubview:bg1];
    UIPickerView *picker = [[UIPickerView alloc] init];
    
    picker.delegate = self;
    picker.dataSource = self;
    sample1.delegate = self;
    sample1.inputView = picker;
    [self.scheduleView addSubview:sample1];
    [timeFromPicker addObject:sample1];
    [self insertTime1:sample1:sample];
    
}
-(void)insertTime1:(UITextField *)sample1:(UITextField *)sample2{
    UIView *bg1 = [[UIView alloc] initWithFrame:CGRectMake(0, sample2.bounds.size.height-1, sample2.bounds.size.width, 1.)];
    [bg1 setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [bg1 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [bg1 setBackgroundColor:[UIColor blackColor]];
    
    UITextField *sample3 = [[UITextField alloc] init];
    sample3.frame = CGRectMake(sample1.frame.origin.x+95, sample1.frame.origin.y, sample1.frame.size.width, sample1.frame.size.height);
    sample3.delegate = self;
    [sample3 addSubview:bg1];
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    sample3.delegate = self;
    sample3.inputView = picker;
    
    
    
    [self.scheduleView addSubview:sample3];
    [timeFromPicker1 addObject:sample3];
}
-(void)postData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *pmdcNum = self.pmdc;
    NSString *gender = self.gender;
    NSString *contactNum = self.contactno;
    NSString *email = self.email;
    NSString *tmpAdress;
    NSString *availab;
    for(int i =0;i<[locationsFromPicker count];i++){
        UITextField *mytmpLocation = [locationsFromPicker objectAtIndex:i];
        UITextField *mytmpTime = [timeFromPicker objectAtIndex:i];
        UITextField *mytmpTime1 = [timeFromPicker1 objectAtIndex:i];
//        if(i == ([locationsFromPicker count]-1)){
//                availab = [NSString stringWithFormat:@"%@ From %@ To %@",[mytmpLocation text],[mytmpTime text],[mytmpTime1 text]];
//        }
//        else
        if(availab !=nil)
            availab = [NSString stringWithFormat:@"%@:%@:%@-%@-%@",availab,self.Day.text,[mytmpLocation text],[mytmpTime text],[mytmpTime1 text]];
        else
            availab = [NSString stringWithFormat:@"%@:%@-%@-%@",self.Day.text,[mytmpLocation text],[mytmpTime text],[mytmpTime1 text]];
//        NSString *myString = [NSString stringWithFormat:@"%@",[[locationsFromPicker objectAtIndex:i] ]];
    }
    NSLog(@"%@",availab);
    for(int i =0;i<[self.address count];i++){
        int j = i+1;
        if(j == [self.address count])
            tmpAdress = [NSString stringWithFormat:@"%@",[self.address objectAtIndex:i]];
        else
            tmpAdress = [NSString stringWithFormat:@"%@:",[self.address objectAtIndex:i]];
    }
    NSString *address = tmpAdress;
    NSString *pass = self.password;
    NSString *specialization = self.specification;
    NSString *fee = [NSString stringWithFormat:@"%ld",(long)self.fee];
    NSString *avail = availab;
    
    
    NSDictionary *dictionary = @{@"PMDC_No": pmdcNum,
                                 @"Gender": gender,
                                 @"Contact_No":contactNum,
                                 @"Email":email,
                                 @"Address":address,
                                 @"Password":pass,
                                 @"Specialization":specialization,
                                 @"Fee":fee,
                                 @"Availability_Hours":avail};
    [manager POST:@"http://doctor-discoverer.eu.pn/post.php" parameters:dictionary progress:nil success:^(NSURLSessionTask *task, id responseObject){
        NSLog(@"%@", responseObject);
        NSLog(@"Request Sent");
    }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"NOT DONE CHANDAN");
              NSLog(@"Error: %@", error);
          }];
}
@end

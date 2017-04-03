//
//  RegisterAsDoctorViewController.m
//  FYP
//
//  Created by apple on 11/15/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "RegisterAsDoctorViewController.h"
#import "ViewController.h"
#import "RegisterAsDoctor2ViewController.h"
#import "AFNetworking.h"
#import "SWRevealViewController.h"
#import "ViewController.h"

@interface RegisterAsDoctorViewController ()

@end

@implementation RegisterAsDoctorViewController
NSDictionary *dic;
NSMutableArray *genderArrray;
BOOL check = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showGender];
    [_checkingPMDC stopAnimating];
    [_checkingPMDC setHidesWhenStopped:YES];
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self getResponse:@"http://doctor-discoverer.eu.pn/getpmdc.php"];
    _pmdc.delegate = self;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.066 green:0.132 blue:0.201 alpha:1]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationItem.backBarButtonItem setTitle:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"home"]){
//        [self.view removeFromSuperview];
        [self performSegueWithIdentifier:@"home" sender:self];
//        [self.popoverPresentationController presentedViewController];
//        self.view = nil;
    }
    else if([segue.identifier isEqualToString:@"registerAsDoctor2"]){
        RegisterAsDoctor2ViewController *controller = segue.destinationViewController;
        if(check == YES)
            controller.pmdc = self.pmdc.text;
        else{
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"PMDC Number not found!" preferredStyle:UIAlertControllerStyleAlert];
//            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//            [self presentViewController:alert animated:YES completion:nil];
            [self showAlert:@"Error" second:@"PMDC Number not found!"];
        }
        if(self.name.text.length == 0){
            [self showAlert:@"Error" second:@"Name can't be empty"];
        }
        else{
            controller.name = self.name.text;
        }
        if(self.gender.text.length == 0){
            [self showAlert:@"Error" second:@"Gender can't be empty"];
        }
        else{
            controller.gender = self.gender.text;
        }
        if(self.qualification.text.length == 0){
            [self showAlert:@"Error" second:@"Qualification can't be empty"];
        }
        else
            controller.qualification = self.qualification.text;
    }
    //    [self.viewcontroller removeFromSuperview];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    [_checkingPMDC startAnimating];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [_checkingPMDC stopAnimating];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *tmp = [NSString stringWithFormat:@"%@%@",_pmdc.text,string];
    NSLog(@"%@",tmp);
    NSLog(@"%@",_pmdc.text);
    NSMutableArray *tmppmdc = [dic valueForKey:@"PMDC_No"];
    if([tmppmdc containsObject:tmp]){
        [_checkingPMDC stopAnimating];
        check = YES;
    }
    else{
        check = NO;
        [_checkingPMDC startAnimating];
    }
    if (range.length==1 && string.length==0 && _pmdc.text.length == 1){
        check = NO;
        [_checkingPMDC stopAnimating];
    }
    return true;
}
-(void)getResponse:(NSString *)url{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            dic = responseObject;
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            
        }];
}
- (void)showGender {
    genderArrray = [[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    self.gender.inputView = picker;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [genderArrray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.gender.text = [genderArrray objectAtIndex:row];
}

-(void)showAlert:(NSString *)eror second:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:eror message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

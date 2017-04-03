//
//  RegisterAsDoctor2ViewController.m
//  FYP
//
//  Created by apple on 11/15/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "RegisterAsDoctor2ViewController.h"
#import "SchedulerViewController.h"
#import "MVPlaceSearchTextField/MVPlaceSearchTextField.h"
@import GooglePlaces;

@interface RegisterAsDoctor2ViewController ()

@end

@implementation RegisterAsDoctor2ViewController
NSMutableArray *locationObjects;
NSMutableArray *categoryNames;
- (void)viewDidLoad {
    [super viewDidLoad];
    locationObjects = [[NSMutableArray alloc] init];
    categoryNames = [[NSMutableArray alloc] initWithObjects:@"Cardiologist",@"Dentist",@"Dermatologist",@"Ear Specialist",@"Eye Specialist",@"Gastroenterologist",@"General Physician",@"Gynecologist",@"Liber Specialist",@"Neurologist",@"Nutritionist",@"Oncologist",@"Orthopedic Surgeon",@"Pediatrician",@"Physchitarist",@"Urologist",@"Other", nil];
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    self.specification.inputView = picker;
    [self setKeyboard];
    [self.view bringSubviewToFront:self.buttonView];
    locationObjects = nil;
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationItem.backBarButtonItem setTitle:@""];
    [[self.myView layer] setBorderWidth:1.0f];
    [[self.myView layer] setBorderColor:[UIColor blackColor].CGColor];
    
    _addressField.delegate = self;
    _addressField.placeSearchDelegate                 = self;
    _addressField.strApiKey                           = @"AIzaSyACnapSLO3ML0jQODIj8DLm3KHDkbe3ZFU";
    _addressField.superViewOfList                     = self.view;  // View, on which Autocompletion list should be appeared.
    _addressField.autoCompleteShouldHideOnSelection   = YES;
    _addressField.maximumNumberOfAutoCompleteRows     = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier  isEqual: @"Scheduler"]){
        SchedulerViewController *controller = segue.destinationViewController;
        controller.pmdc = self.pmdc;
        controller.name = self.name;
        controller.gender = self.gender;
        controller.qualification = self.qualification;
        
        if(self.contactno.text.length == 0){
            [self showAlert:@"Error" second:@"Contact number can't be empty"];
        }
//        else{
//            controller.contactno = self.contactno.text;
//        }
        else if(self.email.text.length == 0){
            [self showAlert:@"Error" second:@"Email can't be empty"];
        }
//        else{
//            controller.email = self.email.text;
//        }
        else if(self.addressField.text.length == 0){
            [self showAlert:@"Error" second:@"Address can't be empty"];
        }
//        else{
//            if(locationObjects == nil){
//                locationObjects = [[NSMutableArray alloc] init];
//            }
//            NSLog(@"%@",self.addressField.text);
//            [locationObjects addObject:self.addressField.text];
//            self.addressField.text = @"";
//            controller.address = locationObjects;
//        }
        else if(self.password.text.length == 0){
            [self showAlert:@"Error" second:@"Password can't be empty"];
        }
        else if(![self.rePassword.text isEqualToString:self.password.text]){
            [self showAlert:@"Error" second:@"Password not match"];
        }
//        else{
//            if(self.rePassword.text.length == 0){
//                [self showAlert:@"Error" second:@"Password not match"];
//            }
//            else{
//                controller.password = self.password.text;
//            }
//        }
        else if(self.specification.text.length ==0){
            [self showAlert:@"Error" second:@"Specification can't be empty"];
        }
//        else{
//            controller.specification = self.specification.text;
//        }
        else if(self.fee.text.length == 0){
            [self showAlert:@"Error" second:@"Fee can't be empty"];
        }
        else{
            controller.contactno = self.contactno.text;
            controller.email = self.email.text;
            NSLog(@"%@",self.addressField.text);
            NSString *tmp = self.addressField.text;
//            [locationObjects addObject:tmp];
            if(locationObjects == nil){
                locationObjects = [NSMutableArray arrayWithObjects:tmp, nil];
            }
            else{
                if(![locationObjects containsObject:tmp]){
                    [locationObjects addObject:tmp];
                }
            }
//            [self addAnotherLocation:self];
            controller.address = locationObjects;
            controller.contactno = self.contactno.text;
            controller.password = self.password.text;
            controller.specification = self.specification.text;
            controller.fee = [self.fee.text integerValue];
//            controller.fee = 500;
        }
        
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Ended");
    [self.view bringSubviewToFront:self.buttonView];
}
- (IBAction)addAnotherLocation:(id)sender {
//    NSLog(@"Adding");
//    NSLog(@"%@",self.addressField.text);
    NSString *locationString = self.addressField.text;
    if(![locationString isEqualToString:@""]){
        self.addressField.text = @"";
        if(locationObjects == nil){
            locationObjects = [NSMutableArray arrayWithObjects:locationString, nil];
        }
        else{
            if(![locationObjects containsObject:locationString]){
                [locationObjects addObject:locationString];
            }
        }
//        NSLog(@"%@",locationObjects);
    }
    else{
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"Message" message:@"Field can't be empty" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Cancel", @"")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                       }];
        
        [alertcontroller addAction:cancelAction];
        [self presentViewController:alertcontroller animated:YES completion:nil];
    }
}
-(void)showAlert:(NSString *)eror second:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:eror message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)setKeyboard{
    [self.contactno setKeyboardType:UIKeyboardTypePhonePad];
    [self.email setKeyboardType:UIKeyboardTypeEmailAddress];
    [self.fee setKeyboardType:UIKeyboardTypeNumberPad];
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [categoryNames count];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [categoryNames objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.specification.text = [categoryNames objectAtIndex:row];
}
@end

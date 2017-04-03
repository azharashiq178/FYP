//
//  RegisterAsDoctor2ViewController.h
//  FYP
//
//  Created by apple on 11/15/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPlaceSearchTextField/MVPlaceSearchTextField.h"
@import GooglePlaces;
@interface RegisterAsDoctor2ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *availHours;
@property (weak, nonatomic) IBOutlet UIView *myView;
- (IBAction)addAnotherLocation:(id)sender;
//@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) NSString *pmdc;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *gender;
@property (weak, nonatomic) NSString *qualification;
@property (nonatomic,weak) IBOutlet UITextField *contactno;
@property (nonatomic,weak) IBOutlet UITextField *email;
@property (nonatomic,weak) IBOutlet UITextField *password;
@property (nonatomic,weak) IBOutlet UITextField *specification;
@property (nonatomic,weak) IBOutlet UITextField *fee;
@property (weak, nonatomic) IBOutlet UITextField *rePassword;
@property (weak, nonatomic) IBOutlet MVPlaceSearchTextField *addressField;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

//
//  RegisterAsDoctorViewController.h
//  FYP
//
//  Created by apple on 11/15/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterAsDoctorViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UITextField *pmdc;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *qualification;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *checkingPMDC;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goToMain;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
- (void)showGender;

@end

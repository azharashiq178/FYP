//
//  ShowProfileViewController.h
//  FYP
//
//  Created by apple on 3/3/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ViewController.h"

@interface ShowProfileViewController : ViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (weak,nonatomic) NSString *pmdcNum;
@property (weak, nonatomic) IBOutlet UILabel *PMDC;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Qualification;
@property (weak, nonatomic) IBOutlet UITextField *Email;
@property (weak, nonatomic) IBOutlet UITextField *Gender;
@property (weak, nonatomic) IBOutlet UITextField *Specialization;
@property (weak, nonatomic) IBOutlet UITextField *ContactNum;
@property (weak, nonatomic) IBOutlet UITextField *Fee;
- (IBAction)editProfile:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editProfileButton;

@end

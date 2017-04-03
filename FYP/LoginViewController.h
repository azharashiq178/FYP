//
//  LoginViewController.h
//  FYP
//
//  Created by apple on 2/23/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
@interface LoginViewController : ViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@property (strong, nonatomic) IBOutlet NSMutableDictionary *dic;
- (IBAction)signup:(id)sender;

@end

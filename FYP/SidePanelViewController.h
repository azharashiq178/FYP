//
//  SidePanelViewController.h
//  FYP
//
//  Created by apple on 10/19/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@interface SidePanelViewController : UITableViewController
- (IBAction)mainScreen:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *goToMain;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *logOutButton;
@property BOOL hideButton;
@end

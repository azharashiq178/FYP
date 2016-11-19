//
//  FeedbackViewController.m
//  FYP
//
//  Created by apple on 11/15/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setScrollEnabled:NO];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyBoard1:)];
    
    [self.view addGestureRecognizer:tap];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.066 green:0.132 blue:0.201 alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.submit.layer.cornerRadius = 5;
    self.submit.clipsToBounds = YES;
//    [self.nameTextField setDelegate:<#(id<UITextFieldDelegate> _Nullable)#>];
    // Do any additional setup after loading the view.
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
        [self.view removeFromSuperview];
        [self.presentedViewController removeFromParentViewController];
        self.view = nil;
    }
    //    [self.viewcontroller removeFromSuperview];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"Here");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    [self.tableView setScrollEnabled:YES];
    // Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-85,320,667)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.tableView setScrollEnabled:NO];
    [self.view setFrame:CGRectMake(0,0,320,667)];
}
-(IBAction)dismissKeyBoard1:(id)sender{
//    NSLog(@"Here");
    [self.nameTextField resignFirstResponder];
    [self.view setFrame:CGRectMake(0,0,320,667)];
//    [self.tableView setScrollEnabled:NO];
}
@end

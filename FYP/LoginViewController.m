//
//  LoginViewController.m
//  FYP
//
//  Created by apple on 2/23/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "SidePanelViewController.h"
#import "SWRevealViewController.h"
#import "ShowProfileViewController.h"
@import AFNetworking;

@interface LoginViewController ()

@end

@implementation LoginViewController
NSString *pmdcNum;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dic = [[NSMutableDictionary alloc] init];
    self.sideBarButton.target = self.revealViewController;
    self.sideBarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self getResponse:@"http://doctor-discoverer.eu.pn/getDoctor.php"];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier]  isEqual: @"login"]){
        ShowProfileViewController *prof = segue.destinationViewController;
        prof.pmdcNum = pmdcNum;
        [prof.navigationItem setTitle:@"Welcome Azher"];
//        prof.title = @"Welcome Azher";
        [prof setTitle:@"Welcome Azher"];
//        prof.navigationItem.title = @"Welcome";
//        [self.navigationController setTitle:@"Welcome Azher"];
    }
//    controller.hideButton = YES;
//    [controller.goToMain setHidden:YES];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)loginAction:(id)sender {
    NSMutableArray *arr = [self.dic valueForKey:@"Email"];
    NSMutableArray *pass = [self.dic valueForKey:@"Password"];
    NSMutableArray *pmdc = [self.dic valueForKey:@"PMDC_No"];
    if([arr containsObject:self.emailField.text] && [pass containsObject:self.passField.text] && [self getIndex:arr second:self.emailField.text] == [self getIndex:pass second:self.passField.text]){
        NSString *loginInfo = @"LoggedIn";
        int index = [self getIndex:arr second:self.emailField.text];
        pmdcNum = [pmdc objectAtIndex:index];
        NSLog(@"PMDC number is:%@",pmdcNum);
        NSData *serialized = [NSKeyedArchiver archivedDataWithRootObject:loginInfo];
        [[NSUserDefaults standardUserDefaults] setObject:serialized forKey:@"myKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self performSegueWithIdentifier:@"login" sender:self];
    }
    else{
        [self showAlert:@"Invalid Login" second:@"Either Email or Password is wrong!"];
        
    }
}
-(void)getResponse:(NSString *)url{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.dic = responseObject;
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
}
-(int)getIndex:(NSMutableArray *)array second:(NSString *)dataToFind{
    int j =-1;
    for(int i =0;i<[array count];i++){
        if([[array objectAtIndex:i] isEqualToString: dataToFind]){
            j = i;
            break;
        }
    }
    return j;
}
-(void)showAlert:(NSString *)eror second:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:eror message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;
}
- (IBAction)signup:(id)sender {
    [self performSegueWithIdentifier:@"signup" sender:self];
}
@end

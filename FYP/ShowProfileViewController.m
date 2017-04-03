//
//  ShowProfileViewController.m
//  FYP
//
//  Created by apple on 3/3/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ShowProfileViewController.h"
@import AFNetworking;

@interface ShowProfileViewController ()

@end

@implementation ShowProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getResponse];
//    NSLog(@"Showing PMDC %@",self.pmdcNum);
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
-(void)getResponse{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *pmdcNum = self.pmdcNum;
    NSString *gender = self.Gender.text;
    NSString *contactNum = self.ContactNum.text;
    NSString *email = self.Email.text;
    NSString *address = @"Johar Town Lahore";
    NSString *pass = @"1";
    NSString *specialization = self.Specialization.text;
    NSString *fee = self.Fee.text;
    NSString *avail = @"5 to 7 pm";
    
    
    NSDictionary *dictionary = @{@"PMDC_No": pmdcNum,
                                 @"Gender": gender,
                                 @"Contact_No":contactNum,
                                 @"Email":email,
                                 @"Address":address,
                                 @"Password":pass,
                                 @"Specialization":specialization,
                                 @"Fee":fee,
                                 @"Availability_Hours":avail};
    [manager POST:@"http://doctor-discoverer.eu.pn/getProfileData.php" parameters:dictionary progress:nil success:^(NSURLSessionTask *task, id responseObject){
        NSDictionary *dic = responseObject;
//        NSString *tmp = [dic valueForKey:@"PMDC_No"];
        NSLog(@"%@",dic);
        self.PMDC.text = [[dic valueForKey:@"PMDC_No"] objectAtIndex:0];
        self.Name.text = [[dic valueForKey:@"Name"] objectAtIndex:0];
        self.Qualification.text = [[dic valueForKey:@"Qualification"] objectAtIndex:0];
        self.Email.text = [[dic valueForKey:@"Email"] objectAtIndex:0];
        self.Gender.text = [[dic valueForKey:@"Gender"] objectAtIndex:0];
        self.Specialization.text = [[dic valueForKey:@"Specialization"] objectAtIndex:0];
        self.Fee.text = [[dic valueForKey:@"Fee"] objectAtIndex:0];
        self.ContactNum.text = [[dic valueForKey:@"Contact_No"] objectAtIndex:0];
//        NSLog(@"%@", responseObject);
//        NSLog(@"Request Sent");
    }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}
-(void)updateInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *pmdcNum = self.pmdcNum;
    NSString *gender = self.Gender.text;
    NSString *contactNum = self.ContactNum.text;
    NSString *email = self.Email.text;
    NSString *address = @"Johar Town Lahore";
    NSString *pass = @"1";
    NSString *specialization = self.Specialization.text;
    NSString *fee = self.Fee.text;
    NSString *avail = @"5 to 7 pm";
    
    
    NSDictionary *dictionary = @{@"PMDC_No": pmdcNum,
                                 @"Gender": gender,
                                 @"Contact_No":contactNum,
                                 @"Email":email,
                                 @"Address":address,
                                 @"Password":pass,
                                 @"Specialization":specialization,
                                 @"Fee":fee,
                                 @"Availability_Hours":avail};
    [manager POST:@"http://doctor-discoverer.eu.pn/updateInfo.php" parameters:dictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:nil];
}
- (IBAction)editProfile:(id)sender {
    if([[self.editProfileButton title] isEqualToString:@"Edit"]){
        self.editProfileButton.title = @"Done";
        [self.Email setEnabled:YES];
        [self.Gender setEnabled:YES];
        [self.Specialization setEnabled:YES];
        [self.ContactNum setEnabled:YES];
        [self.Fee setEnabled:YES];
    }
    else{
        self.editProfileButton.title = @"Edit";
        [self.Email setEnabled:NO];
        [self.Gender setEnabled:NO];
        [self.Specialization setEnabled:NO];
        [self.ContactNum setEnabled:NO];
        [self.Fee setEnabled:NO];
        [self updateInfo];
    }
}
@end

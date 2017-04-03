//
//  SidePanelViewController.m
//  FYP
//
//  Created by apple on 10/19/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SidePanelViewController.h"
#import "ViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
@interface SidePanelViewController ()
@property BOOL myTempCheck;
@end

@implementation SidePanelViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setScrollEnabled:NO];
    _myTempCheck = NO;
//    if(self.hideButton == YES){
//        NSLog(@"i am here");
//        [self.goToMain setHidden:YES];
//    }
//    else{
//        NSLog(@"%@",self.hideButton);
//        NSLog(@"NOt updated");
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)mainScreen:(id)sender {
}
-(void)updateViewController:(LoginViewController *)controller didUserLoggedin:(NSString *)text{
    NSLog(@"Here user logged in");
    self.myTempCheck = YES;
//    if(text == YES){
//        [self.goToMain setHidden:YES];
//    }
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"I am here");
    NSData *serialized = [[NSUserDefaults standardUserDefaults] objectForKey:@"myKey"];
    NSString *loginInfo = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
    if([loginInfo isEqualToString:@"LoggedIn"]){
        [self.loginButton setHidden:YES];
        [self.logOutButton setHidden:NO];
//        [self.goToMain setHidden:YES];
    }
    else{
        [self.loginButton setHidden:NO];
        [self.logOutButton setHidden:YES];
    }
}
- (IBAction)logOutAction:(id)sender {
    NSString *loginInfo = @"LoggedOut";
    NSData *serialized = [NSKeyedArchiver archivedDataWithRootObject:loginInfo];
    [[NSUserDefaults standardUserDefaults] setObject:serialized forKey:@"myKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView reloadData];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if([self.tableView isScrollEnabled]){
        [self.tableView setScrollEnabled:NO];
    }
    else{
        [self.tableView setScrollEnabled:YES];
    }
}
@end

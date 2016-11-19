//
//  SchedulerViewController.m
//  FYP
//
//  Created by apple on 11/18/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SchedulerViewController.h"
#import "SchedulerCollectionViewCell.h"

@interface SchedulerViewController ()

@end

@implementation SchedulerViewController
NSArray *data;
NSInteger *checkPreviousSelection = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [[NSArray alloc] initWithObjects:@"MON",@"TUE",@"WED",@"THU",@"FRI",@"SAT",@"SUN", nil];
    UIView *bg2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.Day.bounds.size.height-1, self.Day.bounds.size.width, 1.)];
    [bg2 setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [bg2 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [bg2 setBackgroundColor:[UIColor grayColor]];
    [self.Day addSubview:bg2];
    [self.navigationItem.backBarButtonItem setTitle:@""];
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
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SchedulerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.Label.text = [data objectAtIndex:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    SchedulerCollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.line.image = nil;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SchedulerCollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.line.image = [UIImage imageNamed:@"line"];
    
    NSString *selectedDay = [data objectAtIndex:indexPath.row];
    if([selectedDay isEqualToString:@"MON"]){
        self.Day.text = @"MONDAY";
    }
    else if([selectedDay isEqualToString:@"TUE"]){
        self.Day.text = @"TUESDAY";
    }
    else if([selectedDay isEqualToString:@"WED"]){
        self.Day.text = @"WEDNESDAY";
    }
    else if([selectedDay isEqualToString:@"THU"]){
        self.Day.text = @"THURSDAY";
    }
    else if([selectedDay isEqualToString:@"FRI"]){
        self.Day.text = @"FRIDAY";
    }
    else if([selectedDay isEqualToString:@"SAT"]){
        self.Day.text = @"SATURDAY";
    }
    else if([selectedDay isEqualToString:@"SUN"]){
        self.Day.text = @"SUNDAY";
    }





        
//    NSLog(@"i am here");
//    SchedulerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    cell.line.image = [UIImage imageNamed:@"line"];
    //    NSLog(@"%@",[categoryNames objectAtIndex:indexPath.row]);
}
#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

//- (IBAction)showSideBar:(id)sender {
//    _sideBarButton.target = self.revealViewController;
//    _sideBarButton.action = @selector(revealToggle:);
//    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
//}

@end

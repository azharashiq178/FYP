//
//  CategoryCollectionViewController.m
//  FYP
//
//  Created by apple on 11/2/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "CategoryCollectionViewController.h"
#import "CategoryCollectionViewCell.h"
#import "SWRevealViewController.h"
#import "ShowCategoryViewController.h"
//#import "ShowViewController1.h"

@interface CategoryCollectionViewController (){
    NSArray *categoryImages;
    NSArray *categoryNames;
}

@end

@implementation CategoryCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.067 green:0.136 blue:0.197 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    categoryImages = [NSArray arrayWithObjects:@"cardiologist",@"dentist",@"dermatologist",@"ent_specialist",@"eye_specialist",@"gastroenterologist",@"general_physician",@"gynecologist",@"liver_specialist",@"neurologist",@"nutritionist",@"oncologist",@"orthopedic_surgeon",@"pediatrician",@"physiotherapist",@"pulmonologist",@"pyschitarist",@"urologist", nil];
    
    categoryNames = [NSArray arrayWithObjects:@"Cardiologist",@"Dentistry",@"Dermatologist",@"Ear specialist",@"Eye specialist", @"Gastroentrology", @"General physician", @"Gynecologist", @"Liver Specialist", @"Neurologist", @"Nutritionist", @"Oncologist", @"Orthopedic Surgeon", @"Pediatrician", @"Physiotherapist", @"Pulmonologist",@"Pyschitarist",@"Urologist", nil];
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
    return [categoryImages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.image.image = [UIImage imageNamed:[categoryImages objectAtIndex:indexPath.row]];
    cell.categoryName.text = [categoryNames objectAtIndex:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showCategory"]){
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
       ShowCategoryViewController *destViewController = segue.destinationViewController;
        destViewController.simpleText = [categoryNames objectAtIndex:indexPath.row];
    }
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (self.view.frame.size.width/2)-8;
    
    return CGSizeMake(width, width/2);
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.collectionView performBatchUpdates:nil completion:nil];
    NSLog(@"Rotated");
}
@end

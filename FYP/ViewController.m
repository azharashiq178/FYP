//
//  ViewController.m
//  FYP
//
//  Created by apple on 9/24/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
@interface ViewController ()
{
    CLLocationManager *locationManager;
}

@end

@implementation ViewController
@synthesize mapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.searchDoctorButton setBackgroundColor:[UIColor colorWithRed:0.105 green:0.383 blue:0.445 alpha:1]];
    self.searchDoctorButton.layer.cornerRadius = 5;
    self.searchDoctorButton.clipsToBounds = YES;
    [self.searchCategoryButton setBackgroundColor:[UIColor colorWithRed:0.105 green:0.383 blue:0.445 alpha:1]];
    self.searchCategoryButton.layer.cornerRadius = 5;
    self.searchCategoryButton.clipsToBounds = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.066 green:0.132 blue:0.201 alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.mapView.delegate = self;
    locationManager = [CLLocationManager new];
    if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [locationManager requestWhenInUseAuthorization];
    }
    self.mapView.showsUserLocation = YES;
    self.mapView.showsBuildings = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.showsCompass = YES;
    self.mapView.showsTraffic = YES;
    // Do any additional setup after loading the view, typically from a nib.
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = userLocation.coordinate;
//    point.title = @"Where am I?";
//    point.subtitle = @"I'm here!!!";
//    
//    [self.mapView addAnnotation:point];
}
- (IBAction)searchCategory:(id)sender {
//    SearchCategoryViewController *controller = [[SearchCategoryViewController alloc] initWithNibName:@"SearchCategoryViewController" bundle:nil];
//    UINavigationController *newController = [[UINavigationController alloc] initWithRootViewController:controller];
//    [self presentViewController:newController animated:YES completion:nil];
}
- (IBAction)disableMap:(id)sender {
    NSLog(@"Here");
//    self.mapView.zoomEnabled = false;
//    self.mapView.scrollEnabled = false;
//    self.mapView.userInteractionEnabled = false;
}
@end

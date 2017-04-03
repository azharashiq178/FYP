//
//  ViewController.h
//  FYP
//
//  Created by apple on 9/24/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@import GoogleMaps;

@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@property (weak, nonatomic) IBOutlet UIButton *searchCategoryButton;
@property (weak, nonatomic) IBOutlet UIButton *searchDoctorButton;
@property (strong, nonatomic) IBOutlet GMSMapView *tempMap;
@property (weak, nonatomic) IBOutlet UIView *myMap;

@property (nonatomic) float lon;
@property (nonatomic) float lat;
//@property(nonatomic,retain) CLLocationManager *locationManager;


- (IBAction)searchCategory:(id)sender;

@end


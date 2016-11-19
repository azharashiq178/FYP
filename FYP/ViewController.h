//
//  ViewController.h
//  FYP
//
//  Created by apple on 9/24/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)searchCategory:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchCategoryButton;
@property (weak, nonatomic) IBOutlet UIButton *searchDoctorButton;

@end


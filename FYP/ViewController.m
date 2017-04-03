//
//  ViewController.m
//  FYP
//
//  Created by apple on 9/24/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationManagerHelper.h"

#import "MovieData.h"

@import AFNetworking;
@import GoogleMaps;

@interface ViewController ()

@property (nonatomic,strong) CLLocation * currentLocation;
@property (nonatomic,strong)GMSPath *path;
@property (nonatomic,strong)NSArray *tmpArray;
@property (nonatomic,strong)GMSPolyline *singleLine;
@property (nonatomic,strong)NSMutableArray *tmpArray1;
@property (nonatomic,strong)NSMutableArray *tmpDrName;

@end

@implementation ViewController{
}

-(void)dealloc{
    
//    [[LocationManagerHelper defaultHelper] stopUpdatingLocation];
//    [[LocationManagerHelper defaultHelper] setDelegate:nil];
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self.activity startAnimating];
//    [self.activity hidesWhenStopped];

    [self.tempMap setUserInteractionEnabled:NO];

//    [self.view layoutIfNeeded];
    [[LocationManagerHelper defaultHelper] setDelegate:self];
    [[LocationManagerHelper defaultHelper] startUpdatingLocation];
    

//    [self showSuggestions];
//    
//    
//    [self showingDoctorLocationsOnMaps];
    
    
    
    ///////////////////////////
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

    
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
////    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
//    NSLog(@"Latitude is %f",locationManager.location.coordinate.latitude);
//    
//    
//    // Add an annotation
////    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
////    point.coordinate = userLocation.coordinate;
////    point.title = @"Where am I?";
////    point.subtitle = @"I'm here!!!";
////    
////    [self.mapView addAnnotation:point];
//}


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
-(void)showSuggestions{
    
}
//-(CLLocationCoordinate2D) getLocation{
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    [locationManager requestWhenInUseAuthorization];
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    locationManager.distanceFilter = kCLDistanceFilterNone;
//    [locationManager startUpdatingLocation];
//    CLLocation *location = [locationManager location];
//    CLLocationCoordinate2D coordinate = [location coordinate];
//    return coordinate;
//}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
//    NSLog(@"Status : %d", status);
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    if (self.currentLocation == nil) {
        
        self.currentLocation = newLocation;

        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.currentLocation.coordinate.latitude longitude:self.currentLocation.coordinate.longitude zoom:16];
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = camera.target;
        
        //    [self.tempMap setDelegate:self];
        self.tempMap.myLocationEnabled = YES;
        self.tempMap.camera = camera;
        
        [self getData:@"http://doctor-discoverer.eu.pn/getDoctor.php"];
        
        [[LocationManagerHelper defaultHelper] stopUpdatingLocation];

    }
}



-(void)showingDoctorLocationsOnMaps{
    NSLog(@"Showing Doctor Location");
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://doctor-discoverer.eu.pn/getDoctor.php" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
//                NSLog(@"%@",responseObject);
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        
        NSLog(@"Error: %@", error);
    }];
}
-(void)postData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *pmdcNum = @"10038-S";
    NSString *gender = @"Male";
    NSString *contactNum = @"000000";
    NSString *email = @"azharashiq178@gmail.com";
    NSString *address = @"Johar Town Lahore";
    NSString *pass = @"1";
    NSString *specialization = @"DDS";
    NSString *fee = @"1000";
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
    [manager POST:@"http://doctor-discoverer.eu.pn/updateInfo.php" parameters:dictionary progress:nil success:^(NSURLSessionTask *task, id responseObject){
        NSLog(@"%@", responseObject);
        NSLog(@"Request Sent");
    }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"NOT DONE CHANDAN");
              NSLog(@"Error: %@", error);
          }];
}

-(void)getResponse{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *pmdcNum = @"14224-N";
    NSString *gender = @"Male";
    NSString *contactNum = @"000000";
    NSString *email = @"azharashiq178@gmail.com";
    NSString *address = @"Johar Town Lahore";
    NSString *pass = @"1";
    NSString *specialization = @"DDS";
    NSString *fee = @"1000";
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
        NSLog(@"%@", responseObject);
        NSLog(@"Request Sent");
    }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"NOT DONE CHANDAN");
              NSLog(@"Error: %@", error);
          }];
}
-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr drName: (NSString *)drName {
    
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:16];
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.snippet = drName;
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setTitle:@"Hi" forState:UIControlStateNormal];
    [marker.iconView addSubview:myButton];
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = self.tempMap;
    marker.map = self.tempMap;
    [self.tempMap setDelegate:self];
    self.tempMap.myLocationEnabled = YES;
//    self.tempMap.camera = camera;
    self.tempMap.settings.scrollGestures = YES;
    self.tempMap.settings.zoomGestures = YES;
    self.tempMap.settings.myLocationButton = YES;
    
    
//    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
//    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    return center;
    
}
-(void)getData:(NSString *)url{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject){
//        NSLog(@"%@", responseObject);
        _tmpArray1 = [responseObject valueForKey:@"Address"];
        _tmpDrName = [responseObject valueForKey:@"Name"];
//        NSLog(@"Array is %lu",(unsigned long)[tmpArray count]);
//        NSLog(@"Array is %lu",(unsigned long)[tmpDrName count]);
        for(int i = 0 ;i<[_tmpArray1 count];i++){
            [self getLocationFromAddressString:[_tmpArray1 objectAtIndex:i] drName:[_tmpDrName objectAtIndex:i]];
        }
        [self.activity stopAnimating];
        [self.activity setHidden:YES];
        [self.tempMap setUserInteractionEnabled:YES];
//        NSLog(@"Request Sent");
    }
          failure:^(NSURLSessionTask *operation, NSError *error) {
//              NSLog(@"NOT DONE CHANDAN");
              NSLog(@"Error: %@", error);
          }];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
}
-(BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker{
    [self.tempMap setSelectedMarker:marker];
    marker.appearAnimation = kGMSMarkerAnimationPop;
    [self hidePolyline:marker];
//    GMSPath *path;
    if(self.tempMap.myLocation!=nil){
        NSString *urlString = [NSString stringWithFormat:@"%@?origin=%f,%f&destination=%f,%f&sensor=true&key=%@",@"https://maps.googleapis.com/maps/api/directions/json",self.tempMap.myLocation.coordinate.latitude,self.tempMap.myLocation.coordinate.longitude,marker.position.latitude,marker.position.longitude,@"AIzaSyACnapSLO3ML0jQODIj8DLm3KHDkbe3ZFU"];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            _tmpArray = [[[[[responseObject valueForKey:@"routes"] valueForKey:@"legs"] valueForKey:@"steps"] valueForKey:@"polyline"] valueForKey:@"points"];
            NSDictionary *dic = [self.tmpArray objectAtIndex:0];
            self.tmpArray = [[NSArray alloc]init];
            self.tmpArray = dic;
            //    NSLog(@"%@",self.tmpArray);
            GMSMutablePath *singleLinePath = [[GMSMutablePath alloc] init];
            [singleLinePath addLatitude:self.currentLocation.coordinate.latitude longitude:self.currentLocation.coordinate.longitude];
            [singleLinePath addLatitude:marker.position.latitude longitude:marker.position.longitude];
            NSString *tmpString;
            for(int i =0;i <[[_tmpArray objectAtIndex:0] count];i++){
                //        NSLog(@"pk is %@",[[self.tmpArray objectAtIndex:0] objectAtIndex:i]);
                tmpString = [[self.tmpArray objectAtIndex:0] objectAtIndex:i];
//                NSLog(@"%@",tmpString);
                self.path = [GMSPath pathFromEncodedPath:tmpString];
                _singleLine = [GMSPolyline polylineWithPath:self.path];
                _singleLine.strokeColor = [UIColor redColor];
                _singleLine.strokeWidth = 5;
                _singleLine.map = self.tempMap;
                self.path = [[GMSPath alloc] init];
            }
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            
            
            NSLog(@"Error: %@", error);
        }];
        
    }
    
//    NSLog(@"%@",tmpString);
//    GMSPath *tmpPath = [GMSPath pathFromEncodedPath:@"ag~~DwtmdM_AA?O"];
//    singleLine = [GMSPolyline polylineWithPath:tmpPath];
//    singleLine.map = self.tempMap;
    
    return true;
}
-(void)viewDidAppear:(BOOL)animated{
    [[LocationManagerHelper defaultHelper] setDelegate:self];
    [[LocationManagerHelper defaultHelper] startUpdatingLocation];
//    [self viewDidLoad];
//    [[LocationManagerHelper defaultHelper] setDelegate:self];
//    [[LocationManagerHelper defaultHelper] startUpdatingLocation];
}
-(void)hidePolyline:(GMSMarker *)marker{
//    NSLog(@"Here");
    if(self.tmpArray){
        [self.activity startAnimating];
        [self.activity setHidden:NO];
        [self.tempMap clear];
//        [self.tempMap setUserInteractionEnabled:NO];
        for(int i = 0 ;i<[_tmpArray1 count];i++){
            [self getLocationFromAddressString:[_tmpArray1 objectAtIndex:i] drName:[_tmpDrName objectAtIndex:i]];
        }
        [self.activity setHidden:YES];
        [self.activity stopAnimating];
        [self.tempMap setUserInteractionEnabled:YES];
    }
}
//-(UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker{
//    UIView *myView = [[UIView alloc] init];
//    UIButton *myButton = [[UIButton alloc] init];
//    [myView addSubview:myButton];
//    return myView;
//}
@end

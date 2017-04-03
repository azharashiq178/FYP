//
//  SearchResultViewController.m
//  FYP
//
//  Created by apple on 3/9/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "SearchResultViewController.h"
@import AFNetworking;

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activity startAnimating];
    [self.activity hidesWhenStopped];
    [self getResponse];
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
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);
        //        NSString *tmp = [dic valueForKey:@"PMDC_No"];
        //        NSLog(tmp);
//        self.PMDC.text = [[dic valueForKey:@"PMDC_No"] objectAtIndex:0];
        //        NSLog(@"%@", responseObject);
        NSString *tmpText = [NSString stringWithFormat:@"Dr.%@",[[dic valueForKey:@"Name"] objectAtIndex:0]];
        self.doctorName.text = tmpText;
        self.doctorSpecialization.text = [[dic valueForKey:@"Specialization"] objectAtIndex:0];
        self.doctorQualification.text = [[dic valueForKey:@"Qualification"] objectAtIndex:0];
        [self.line setHidden:NO];
        self.doctorFee.text = [NSString stringWithFormat:@"Fee: %@ Rs",[[dic valueForKey:@"Fee"] objectAtIndex:0]];
        [self.doctorFee setHidden:NO];
        [self.bookAppointment setHidden:NO];
        [self.line2 setHidden:NO];
//        [self.tempMap setHidden:NO];
        [self.myTempMap setHidden:NO];
        [self.addressLabel setHidden:NO];
        [self.activity stopAnimating];
        [self.activity setHidden:YES];
        [self.myTempMap.settings setZoomGestures:YES];
        [self.myTempMap.settings setCompassButton:YES];
//        [self getLocationFromAddressString:[[dic valueForKey:@"Address"] objectAtIndex:0]];
        [self getLocationFromAddressString:[[dic valueForKey:@"Address"] objectAtIndex:0] second:self.doctorName.text];
//        [self getLocationFromAddressString:@"university of management and technology lahore"];
//        [self getLocationFromAddressString:@"university of education lahore"];
        NSLog(@"Request Sent");
    }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}
-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr second:(NSString *)name{
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
    [self.myTempMap clear];
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:16];
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    NSLog(@"%@",name);
//    marker.snippet = name;
    marker.title = name;
    marker.snippet = addressStr;
    NSLog(@"%@",marker.title);
//    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = self.myTempMap;
//    marker.tracksInfoWindowChanges = YES;
    [self.myTempMap setDelegate:self];
    self.myTempMap.myLocationEnabled = YES;
    self.myTempMap.camera = camera;
    self.myTempMap.settings.scrollGestures = YES;
    self.myTempMap.settings.zoomGestures = YES;
    self.myTempMap.settings.myLocationButton = YES;
    
    
//    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
//    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    return center;
    
}
@end

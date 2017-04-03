//
//  LocationManagerHelper.m
//  ClubMerkaz
//
//  Created by apple on 6/30/16.
//  Copyright © 2016 organization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManagerHelper.h"

@implementation LocationManagerHelper


+(LocationManagerHelper *)defaultHelper{

    static LocationManagerHelper * helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[LocationManagerHelper alloc] init];
    });
    return helper;
}


-(id)init
{
    self = [super init];
    
    if (self)
    {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        [_locationManager setDistanceFilter:kCLDistanceFilterNone];
    }
    return self;
}

-(void)startUpdatingLocation{

    if (_delegate) {
        [_locationManager setDelegate:_delegate];
    }

    NSUInteger statusCode = [CLLocationManager authorizationStatus];
    
    if (statusCode == kCLAuthorizationStatusNotDetermined) {
    
        [_locationManager requestWhenInUseAuthorization];
    }
    else if (statusCode == kCLAuthorizationStatusDenied || statusCode == kCLAuthorizationStatusRestricted){
        
        UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"Warnning!" message:@"Go to settings and turn on location services to allow Doctor Discoverer to access your location." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * OKAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            [alertView dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertView addAction:OKAction];
    }
    
    [_locationManager startUpdatingLocation];
}

-(void)stopUpdatingLocation{

    [_locationManager stopUpdatingLocation];
    [_locationManager setDelegate:nil];
}

@end

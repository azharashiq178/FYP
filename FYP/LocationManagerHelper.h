//
//  LocationManagerHelper.h
//  ClubMerkaz
//
//  Created by apple on 6/30/16.
//  Copyright © 2016 organization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManagerHelper : NSObject<CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager * locationManager;

@property (nonatomic, weak) id delegate;

+(LocationManagerHelper*) defaultHelper;

-(void)startUpdatingLocation;
-(void)stopUpdatingLocation;

@end

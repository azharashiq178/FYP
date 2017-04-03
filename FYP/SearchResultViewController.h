//
//  SearchResultViewController.h
//  FYP
//
//  Created by apple on 3/9/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ViewController.h"

@interface SearchResultViewController : ViewController<MKMapViewDelegate>
@property (weak,nonatomic) NSString *pmdcNum;
@property (weak, nonatomic) IBOutlet UILabel *doctorName;
@property (weak, nonatomic) IBOutlet UILabel *doctorSpecialization;
@property (weak, nonatomic) IBOutlet UILabel *doctorQualification;
@property (weak, nonatomic) IBOutlet UIImageView *line;
@property (weak, nonatomic) IBOutlet UILabel *doctorFee;
@property (weak, nonatomic) IBOutlet UIImageView *line2;
@property (weak, nonatomic) IBOutlet UIButton *bookAppointment;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet GMSMapView *myTempMap;

@end

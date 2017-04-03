//
//  SearchDoctorTableViewCell.m
//  FYP
//
//  Created by apple on 3/3/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "SearchDoctorTableViewCell.h"

@implementation SearchDoctorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.address setAdjustsFontSizeToFitWidth:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

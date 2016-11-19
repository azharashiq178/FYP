//
//  SchedulerViewController.h
//  FYP
//
//  Created by apple on 11/18/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchedulerViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *Day;

@end

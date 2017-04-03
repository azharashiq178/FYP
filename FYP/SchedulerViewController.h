//
//  SchedulerViewController.h
//  FYP
//
//  Created by apple on 11/18/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchedulerViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *Day;
- (IBAction)addTime:(id)sender;
@property (nonatomic,weak) NSString *pmdc;
@property (nonatomic,weak) NSString *name;
@property (nonatomic,weak) NSString *gender;
@property (nonatomic,weak) NSString *qualification;
@property (nonatomic,strong) NSString *contactno;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *specification;
@property (nonatomic) NSInteger *fee;
@property (nonatomic,weak) NSMutableArray *address;
@property (weak, nonatomic) IBOutlet UITextField *pickerText;
@property (weak, nonatomic) IBOutlet UIView *scheduleView;

- (IBAction)changePosition:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
//- (IBAction)changeToPicker:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

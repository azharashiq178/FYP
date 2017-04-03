//
//  SearchDoctorViewController.h
//  FYP
//
//  Created by apple on 2/3/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDoctorViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchController;

@property (nonatomic,strong) NSMutableArray *doctorData;

@end

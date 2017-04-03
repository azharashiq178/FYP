//
//  ShowCategoryViewController.h
//  FYP
//
//  Created by apple on 11/2/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCategoryViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
//@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@property (weak, nonatomic) IBOutlet UILabel *cName;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic)  NSString    *simpleText;
@property (weak, nonatomic) IBOutlet UISearchBar *searchController;
@property (nonatomic,strong) NSMutableArray *doctorData;
@end

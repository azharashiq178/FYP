//
//  CategoryCollectionViewController.h
//  FYP
//
//  Created by apple on 11/2/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet UIImageView *images;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
- (IBAction)showSideBar:(id)sender;


@end

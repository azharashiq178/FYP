//
//  ShowCategoryViewController.m
//  FYP
//
//  Created by apple on 11/2/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ShowCategoryViewController.h"

@interface ShowCategoryViewController ()

@end

@implementation ShowCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _categoryName = self.categoryName;
//    NSLog(@"%@",self.categoryName.text);
    self.title = self.simpleText;
    
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

@end

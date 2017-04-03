//
//  ShowCategoryViewController.m
//  FYP
//
//  Created by apple on 11/2/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ShowCategoryViewController.h"
#import "AFNetworking.h"
#import "DoctorData.h"
#import "ShowCategoryTableViewCell.h"
#import "SearchResultViewController.h"

@interface ShowCategoryViewController (){
    NSMutableArray *namesArray;
    NSMutableArray *tmpArray;
    NSDictionary *dictionary;
    NSDictionary *dictionary1;
    NSString *tmpPMDC;
}

@end

@implementation ShowCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.simpleText;
    dictionary = [[NSDictionary alloc] init];
    dictionary1 = [[NSDictionary alloc] init];
    self.doctorData = [[NSMutableArray alloc] init];
    [self getResponse];
    // Do any additional setup after loading the view.
//    _categoryName = self.categoryName;
//    NSLog(@"%@",self.categoryName.text);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"searchResult"]){
        SearchResultViewController *controller = segue.destinationViewController;
        controller.pmdcNum = tmpPMDC;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(void)getResponse{
    tmpArray = [[NSMutableArray alloc] init];
    self.searchController.showsCancelButton = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://doctor-discoverer.eu.pn/getDoctor.php" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"%@",responseObject);
        
        dictionary = responseObject;
        namesArray = [dictionary valueForKey:@"PMDC_No"];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    [manager GET:@"http://doctor-discoverer.eu.pn/getpmdc.php" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        dictionary1 = responseObject;
//        NSLog(@"%@",dictionary1);
        [self setDoctorDataObject:dictionary secondArray:dictionary1];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
}
-(void)setDoctorDataObject:(NSDictionary *)firstArray secondArray:(NSDictionary *)secondArray{
    for(int i =0 ;i< [firstArray count];i++){
        NSString *tmp = [[firstArray valueForKey:@"PMDC_No"] objectAtIndex:i];
        for(int j =0 ;j <[secondArray count];j++){
            NSString *tmp1 = [[secondArray valueForKey:@"PMDC_No"] objectAtIndex:j];
            if([tmp isEqualToString:tmp1]){
                DoctorData *tmpDoctorData = [DoctorData new];
                tmpDoctorData.Name = [[secondArray valueForKey:@"Name"] objectAtIndex:j];
                tmpDoctorData.PMDC_No = [[secondArray valueForKey:@"PMDC_No"] objectAtIndex:j];
                tmpDoctorData.Qualification = [[secondArray valueForKey:@"Qualification"] objectAtIndex:j];
                
                tmpDoctorData.Address = [[firstArray valueForKey:@"Address"] objectAtIndex:i];
                tmpDoctorData.Availability_Hours = [[firstArray valueForKey:@"Availability_Hours"] objectAtIndex:i];
                tmpDoctorData.Contact_No = [[firstArray valueForKey:@"Contact_No"] objectAtIndex:i];
                tmpDoctorData.Email = [[firstArray valueForKey:@"Email"] objectAtIndex:i];
                tmpDoctorData.Fee = [[firstArray valueForKey:@"Fee"] objectAtIndex:i];
                tmpDoctorData.Gender = [[firstArray valueForKey:@"Gender"] objectAtIndex:i];
                tmpDoctorData.Password = [[firstArray valueForKey:@"Password"] objectAtIndex:i];
                tmpDoctorData.Specialization = [[firstArray valueForKey:@"Specialization"] objectAtIndex:i];
                if([tmpDoctorData.Specialization isEqualToString:self.simpleText]){
                    [self.doctorData addObject:tmpDoctorData];
                }
                
            }
        }
    }
    tmpArray = self.doctorData;
    [self.tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tmpArray count];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%@",[[tmpArray objectAtIndex:indexPath.row] PMDC_No]);
    tmpPMDC = [[tmpArray objectAtIndex:indexPath.row] PMDC_No];
    [self performSegueWithIdentifier:@"searchResult" sender:self];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"categoryTable";
    ShowCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil){
        cell = [[ShowCategoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.name.text = [[tmpArray objectAtIndex:indexPath.row] Name];
    cell.fee.text = [[tmpArray objectAtIndex:indexPath.row] Fee];
    cell.qualification.text = [[tmpArray objectAtIndex:indexPath.row] Qualification];
    cell.address.text = [[tmpArray objectAtIndex:indexPath.row] Address];
    if([[[tmpArray objectAtIndex:indexPath.row] Gender] isEqualToString:@"Male"]){
        cell.drImage.image = [UIImage imageNamed:@"Doctor Male-25"];
    }
    else{
        cell.drImage.image = [UIImage imageNamed:@"Doctor Female-96"];
    }
    return cell;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"changing text");
    if([searchText length] == 0){
        tmpArray = self.doctorData;
    }
    else{
        NSMutableArray *tmpSearchResult = [[NSMutableArray alloc] init];
        for(DoctorData *tmp in self.doctorData){
            NSString *tmpName = tmp.Name;
            NSRange r = [tmpName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(r.location != NSNotFound){
                [tmpSearchResult addObject:tmp];
            }
        }
        tmpArray = tmpSearchResult;
    }
    [self.tableView reloadData];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text = @" ";
    [searchBar resignFirstResponder];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;
}
@end

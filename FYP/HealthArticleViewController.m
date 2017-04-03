//
//  HealthArticleViewController.m
//  FYP
//
//  Created by apple on 3/9/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "HealthArticleViewController.h"
#import "SWRevealViewController.h"

@interface HealthArticleViewController ()

@end

@implementation HealthArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = @"http://doctor-discoverer.eu.pn/healthBlog.html";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.startActivity startAnimating];
    [_webView loadRequest:urlRequest];
    [self.startActivity setHidesWhenStopped:YES];
    _sideButton.target = self.revealViewController;
    _sideButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.startActivity startAnimating];
    [self.webView setHidden:YES];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.startActivity stopAnimating];
    [self.webView setHidden:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender {
    if([self.webView canGoBack]){
        [self.webView goBack];
    }
}

- (IBAction)goForward:(id)sender {
    if([self.webView canGoForward]){
        [self.webView goForward];
    }
}
@end

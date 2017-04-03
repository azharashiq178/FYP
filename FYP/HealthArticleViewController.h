//
//  HealthArticleViewController.h
//  FYP
//
//  Created by apple on 3/9/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ViewController.h"

@interface HealthArticleViewController : ViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *startActivity;
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;


@end

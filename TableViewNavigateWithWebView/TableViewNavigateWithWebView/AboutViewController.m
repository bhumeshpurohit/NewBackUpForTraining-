//
//  AboutViewController.m
//  TableViewNavigateWithWebView
//
//  Created by Bhumesh on 14/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
{
    IBOutlet UIScrollView *mainScrollView;
    
}
@synthesize webView;
- (void)viewDidLoad {
    [super viewDidLoad];
   NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"about.html" ofType:nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
   mainScrollView.contentSize = webView.bounds.size;
    //Static Url
   /* NSURL *url = [NSURL URLWithString:@"http://google.co.in"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];*/
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", error);
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
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

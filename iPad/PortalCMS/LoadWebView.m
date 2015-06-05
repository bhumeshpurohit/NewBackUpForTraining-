//
//  LoadWebView.m
//  PortalCMS
//
//  Created by Etisbew on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoadWebView.h"

@interface LoadWebView ()

@end

@implementation LoadWebView
@synthesize loadWebview;
@synthesize req;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self performSelectorInBackground:@selector(activeLico) withObject:nil];
    [loadWebview loadRequest:req];
}

- (void) activeLico
{
	activity.center=self.view.center;
	[self.view addSubview:activity];
	[activity startAnimating];
	activity.hidden=NO;
	//activity.backgroundColor=[UIColor blackColor];
	//self.view.alpha=0.50;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [activity stopAnimating];
    activity.hidden=YES;
}

- (void)viewDidUnload
{
   // [self setLoadWebview:nil];
    //loadWebview = nil;
    //backButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)backBtnClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

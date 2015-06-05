//
//  LoadWebView.h
//  PortalCMS
//
//  Created by Etisbew on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadWebView : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *loadWebview;
    IBOutlet UIToolbar *backButton;
    NSURLRequest *req;
    IBOutlet UIActivityIndicatorView *activity;
}
@property (strong, nonatomic) IBOutlet UIWebView *loadWebview;
@property (strong, nonatomic) NSURLRequest *req;

-(IBAction)backBtnClicked:(id)sender;
- (void) activeLico;
@end

//
//  AboutViewController.h
//  TableViewNavigateWithWebView
//
//  Created by Bhumesh on 14/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) IBOutlet UIWebView *webView;
@end

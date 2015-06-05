//
//  ViewController.h
//  FBShare
//
//  Created by Bhumesh on 28/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface ViewController : UIViewController
{
    UIButton *btnLogin;
    UIButton *btnPublish;
    UILabel *lblUser;
    UIActivityIndicatorView *actView;
    

    NSArray *permissions;
    BOOL isConnected;
}


@end


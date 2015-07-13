//
//  ViewController.h
//  JSONDemo2
//
//  Created by Bhumesh on 25/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"] //2

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *Humanread;
@property (strong, nonatomic) IBOutlet UILabel *JSONFormat;


@end


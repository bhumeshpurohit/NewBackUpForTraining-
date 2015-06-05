//
//  SecondViewController.h
//  taskdemo
//
//  Created by Bhumesh on 25/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//
#import "aViewController.h"
#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,retain)NSString *titleStr;
@property (nonatomic,retain)UIImage *img;
@property (nonatomic,retain)NSString *desc;
@end
    
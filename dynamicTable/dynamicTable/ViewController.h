//
//  ViewController.h
//  dynamicTable
//
//  Created by Bhumesh on 03/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate    >
@property IBOutlet UITableView *tblView;

@end


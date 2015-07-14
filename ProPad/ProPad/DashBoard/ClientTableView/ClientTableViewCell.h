//
//  ClientTableViewCell.h
//  ProPad
//
//  Created by Bhumesh on 02/07/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblClientName;
@property (strong, nonatomic) IBOutlet UILabel *lblVehicle;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@end

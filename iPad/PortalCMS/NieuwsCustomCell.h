//
//  NieuwsCustomCell.h
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NieuwsCustomCell : UITableViewCell
{
    UIImageView *newsSummaryImageView;
    UILabel *newsTitleLabel;
    UILabel *newsSummaryLabel;
    UILabel *newsDatePublishedLabel;
    UIButton *newsAuthorButton;
}
@property (nonatomic,retain) IBOutlet UILabel *newsTitleLabel;
@property (nonatomic,retain) IBOutlet UILabel *newsSummaryLabel;
@property (nonatomic,retain) IBOutlet UILabel *newsDatePublishedLabel;
@property (nonatomic,retain) IBOutlet UIButton *newsAuthorButton;
@property (nonatomic,strong) IBOutlet UILabel *doorLabel;
@property (nonatomic,strong) IBOutlet UILabel *opLabel;
@property (nonatomic,retain) IBOutlet UIImageView *newsSummaryImageView;
@end

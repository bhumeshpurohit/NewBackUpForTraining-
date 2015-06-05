//
//  NieuwsCustomCell.m
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NieuwsCustomCell.h"

@implementation NieuwsCustomCell
@synthesize newsSummaryImageView;
@synthesize newsTitleLabel;
@synthesize newsSummaryLabel;
@synthesize newsDatePublishedLabel;
@synthesize newsAuthorButton;
@synthesize doorLabel = _doorLabel;
@synthesize opLabel = _opLabel;
 
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

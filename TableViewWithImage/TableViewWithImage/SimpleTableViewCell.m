//
//  TableViewCell.m
//  TableViewWithImage
//
//  Created by Bhumesh on 12/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "SimpleTableViewCell.h"

@implementation SimpleTableViewCell
@synthesize nameLabel = _nameLabel;

@synthesize thumbnailImageView = _thumbnailImageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  WikiParentClass.h
//  PortalCMS
//
//  Created by Etisbew on 12/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WikiParentClass : NSObject {
    NSString *responseString;
    NSString *WikiIdString;
    NSString *WikiNameString;
    NSString *WikiCountString;
 }
@property (nonatomic,retain) NSString *WikiCountString;
@property (nonatomic,retain) NSString *responseString;
@property (nonatomic,retain) NSString *WikiIdString;
@property (nonatomic,retain) NSString *WikiNameString;
@end

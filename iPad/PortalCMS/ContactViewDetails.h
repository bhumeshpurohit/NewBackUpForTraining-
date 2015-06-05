//
//  ContactViewDetails.h
//  PortalCMS
//
//  Created by Etisbew on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactViewDetails : NSObject {
    
    NSString *usersEmailString;
    NSString *usersNameString;
    NSString *usersMobileString;
    NSString *usersTelphoneString;
    NSString *usersExpertiseString;
    NSString *usersFunctieString;
    NSString *usersImageString;
}

@property (strong,nonatomic) NSString *usersEmailString;
@property (strong,nonatomic) NSString *usersNameString;
@property (strong,nonatomic) NSString *usersMobileString;
@property (strong,nonatomic) NSString *usersTelphoneString;
@property (strong,nonatomic) NSString *usersExpertiseString;
@property (strong,nonatomic) NSString *usersFunctieString;
@property (strong,nonatomic) NSString *usersImageString;

@end

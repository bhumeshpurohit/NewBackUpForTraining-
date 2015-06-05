//
//  ContactenClass.h
//  PortalCMS
//
//  Created by Etisbew on 09/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactenClass : NSObject {
    NSString *responseString;
    NSString *usersEmailString;
    NSString *usersNameString;
    NSString *usersMobileString;
    NSString *usersTelphoneString;
    NSString *usersExpertiseString;
    
    NSString *usersFunctieString;
    NSString *usersImageString;
   
    NSMutableArray *usersEmailArray;
    NSMutableArray *usersNameArray;
   // NSString *countString;
    
}
//@property (strong,nonatomic) NSString *countString;
@property (strong,nonatomic) NSString *responseString;
@property (strong,nonatomic) NSString *usersEmailString;
@property (strong,nonatomic) NSString *usersNameString;
@property (strong,nonatomic) NSString *usersMobileString;
@property (strong,nonatomic) NSString *usersTelphoneString;
@property (strong,nonatomic) NSString *usersExpertiseString;

@property (strong,nonatomic) NSString *usersFunctieString;
@property (strong,nonatomic) NSString *usersImageString;
@property (strong,nonatomic) NSMutableArray *usersEmailArray;
@property (strong,nonatomic) NSMutableArray *usersNameArray;
@end

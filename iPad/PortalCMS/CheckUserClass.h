//
//  CheckUserClass.h
//  PortalCMS
//
//  Created by Etisbew on 08/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckUserClass : NSObject {
    NSString *responseString;
    NSString *userIdString;
}
@property (nonatomic,strong) NSString *responseString; 
@property (nonatomic,strong) NSString *userIdString; 
@end

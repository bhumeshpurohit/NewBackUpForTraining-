//
//  MobileSearchClass.h
//  PortalCMS
//
//  Created by Etisbew on 08/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MobileSearchClass : NSObject {

    NSString *responseString;
    NSString *newsString;
}
@property (nonatomic,strong) NSString *responseString;
@property (strong,nonatomic) NSString *newsString; 
@end

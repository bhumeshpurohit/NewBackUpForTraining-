//
//  CommentsClass.h
//  PortalCMS
//
//  Created by Etisbew on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentsClass : NSObject {
    
    NSString *valueString;
    NSString *datepostedString;
    NSString *userimageString;
}
@property (strong,nonatomic) NSString *valueString;
@property (strong,nonatomic) NSString *datepostedString;
@property (strong,nonatomic) NSString *userimageString;

@end

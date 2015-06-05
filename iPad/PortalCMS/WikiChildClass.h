//
//  WikiChildClass.h
//  PortalCMS
//
//  Created by Etisbew on 12/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WikiChildClass : NSObject {
   
    //Child Details
    
    NSString *titleNameString;
    NSString *treeIdString;
    NSString *isParentString;
    NSString *responseString;
    NSString *descString;
    
    //
    NSString *childrenString;
    NSString *childString;
    NSString *treeidsString;
    NSString *nameString;
    
    
}
@property (nonatomic,retain) NSString *nameString;
@property (nonatomic,retain) NSString *childrenString;
@property (nonatomic,retain) NSString *childString;
@property (nonatomic,retain) NSString *treeidsString;

@property (nonatomic,retain) NSString *responseString;
@property (nonatomic,retain) NSString *titleNameString;
@property (nonatomic,retain) NSString *treeIdString;
@property (nonatomic,retain) NSString *isParentString;
@property (nonatomic,retain) NSString *descString;
@end

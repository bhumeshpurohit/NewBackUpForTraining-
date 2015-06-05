//
//  NieuwsClass.h
//  PortalCMS
//
//  Created by Etisbew on 08/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NieuwsClass : NSObject {
   
    NSString *responseString;
    NSString *countString;
   // NSString *newsTitleString;
    //NSString *newsSummaryString;
    NSString *newsSummaryImageString;
   // NSString *newsDatePublishedString;
   // NSString *newsAuthorString;
    //NSString *newsTocusString;
   // NSString *newsIdString;
   // NSString *newsUserIdString;
    UIImage *appIcon;
    
    //Comments
}
@property (strong,nonatomic) UIImage *appIcon;
@property (strong,nonatomic) NSString *countString;
//@property (strong,nonatomic) NSString *newsUserIdString;
@property (strong,nonatomic) NSString *responseString;
//@property (strong,nonatomic) NSString *newsTitleString;
//@property (strong,nonatomic) NSString *newsSummaryString;
@property (strong,nonatomic) NSString *newsSummaryImageString;
//@property (strong,nonatomic) NSString *newsDatePublishedString;
//@property (strong,nonatomic) NSString *newsAuthorString;
//@property (strong,nonatomic) NSString *newsTocusString;
//@property (strong,nonatomic) NSString *newsIdString;

//Comments

@end

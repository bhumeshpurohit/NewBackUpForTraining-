//
//  WikiSearchClass.h
//  PortalCMS
//
//  Created by Etisbew on 19/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WikiSearchClass : NSObject {
    NSMutableArray *searchResultsArray;
    NSString *wikiSearchId;
    NSString *wikiSearchName;
    NSString *wikiSearchIsParent;
    NSString *responseString;
}
@property (nonatomic,retain)  NSString *responseString;
@property (nonatomic,retain) NSMutableArray *searchResultsArray; 
@property (nonatomic,retain) NSString *wikiSearchId;
@property (nonatomic,retain) NSString *wikiSearchName;
@property (nonatomic,retain) NSString *wikiSearchIsParent;
@end

//
//  WebService.h
//  SampleXmlParseService
//
//  Created by Etisbew on 06/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ActivationClass.h"
#import "CheckUserClass.h"
#import "MobileSearchClass.h"
#import "NieuwsClass.h"
#import "ContactenClass.h"
#import "WikiParentClass.h"
#import "WikiChildClass.h"
#import "CommentsClass.h"
#import "ContactViewDetails.h"
#import "WikiSearchClass.h"
#import "Reachability.h"

@interface WebService : NSObject <NSXMLParserDelegate>{
    NSURL *portalCMSUrl;
    int statuscode;
    // Post ActivationService Variables
	NSXMLParser *parserActivationClass;
	NSString *stringActivationClass;
	NSData *responseActivationData;
	NSMutableArray *arrayActivationDetails;
	ActivationClass *tempActivationClass;  
   
    // Post CheckUserService Variables
    NSXMLParser *checkUserClassParser;
	NSString *checkUserClassString;
	NSData *responseCheckUserData;
	NSMutableArray *CheckUserArray;
	CheckUserClass *tempCheckUserClass;  
    
    // Post MobileSearchService Variables
    NSXMLParser *MobileSearchParser;
	NSString *MobileSearchString;
	NSData *responseMobileSearchData;
	NSMutableArray *MobileSearchArray;
	MobileSearchClass *tempMobileSearchClass;  
    
    // Post newsWebService Variables
    NSXMLParser *nieuwsParser;
	NSString *nieuwsString;
	NSData *responseNieuwsData;
	NSMutableArray *nieuwsDetailsArray;
    NSMutableArray *blogsDetailsArray;//----------------------
    NSMutableArray *resultDetailsArray;//---------------
	//NieuwsClass *tempNieuwsClass;
    
    // Post MobileSearchService Variables
    NSXMLParser *contactenClassParser;
	NSString *contactenClassString;
	NSData *responseContactenClassData;
	ContactenClass *tempContactenClass;  
    NSMutableArray *ContactenClassArray; 
    
    
    // Post WikiParentClass Variables
    NSXMLParser *wikiDetailsParser;
	NSString *wikiDetailsString;
	NSData *responsewikiDetailsData;
	WikiParentClass *tempWikiParentClass;  
    NSMutableArray *WikiParentDetailsArray;
    
    // Post WikiChildClass Variables
    NSXMLParser *wikiChildParser;
	NSString *wikiChildString;
	NSData *responsewikiChildData;
	WikiChildClass *tempWikiChildClass;  
    NSMutableArray *WikiChildDetailsArray;
    
    // Post comments Variables
    NSXMLParser *commentsParser;
	NSString *commentsString;
	NSData *responseCommentsData;
    CommentsClass *tempCommentsClass;
    NSMutableArray *commentsDetailsArray; 
    
    //ContactView Details
    NSXMLParser *contactDetailsParser;
	NSString *contactDetailsString;
	NSData *responsecontactData;
    ContactViewDetails *tempContactViewDetails;
    NSMutableArray *contactDetailsArray;
    
    
	NSData *responseWikiSearchData;    
	NSData *responseWikiDescData;
    
    //Remove HTML tags
    NSMutableArray *newsTocusArray,*wikiIdArray,*newssummaryArray;
    NSArray* tempArray,*tempIdArray,*summarytempArray;
    
    
    
     NSArray* tempnewsAuthorArray,*tempnewstitleArray,*tempnewsDateArray;
    NSArray *tempnewsImageArray,*tempnewsIdArray,*tempnewuserIdArray;
    
    NSMutableArray *newsAuthorArray,*newstitleArray,*newsDateArray,*newsImageArray;
    NSMutableArray *newsIdArray,*newuserIdArray,*valueArray;
    
    
    NSArray *tempvalueArray;
    
    NSString *strResponse;
    
    NSString *newsResponseString;
     NSString *contactsResponseString;
    
    NSString *wikiResponseString;
}
@property (strong, nonatomic)  NSString *wikiResponseString;
@property (strong, nonatomic)  NSString *contactsResponseString;
@property (strong, nonatomic)  NSString *newsResponseString;
@property (strong, nonatomic)  NSString *strResponse;
@property (strong, nonatomic) NSArray *tempvalueArray;
@property (strong, nonatomic) NSArray *tempnewsIdArray,*tempnewuserIdArray;
@property (strong, nonatomic) NSMutableArray *newsIdArray,*newuserIdArray,*valueArray;
@property (strong, nonatomic) NSMutableArray *newsAuthorArray,*newstitleArray,*newsDateArray,*newsImageArray;
@property (strong, nonatomic) NSArray* tempArray,*tempIdArray,*summarytempArray;
@property (strong, nonatomic) NSMutableDictionary* tempDict;
@property (strong, nonatomic) NSMutableArray *newsTocusArray,*wikiIdArray,*newssummaryArray;
@property (strong, nonatomic) NSMutableArray *blogsTocusArray;
@property (strong, nonatomic) NSArray* tempnewsAuthorArray,*tempnewstitleArray,*tempnewsDateArray;
@property (strong, nonatomic) NSArray *tempnewsImageArray;
 @property (assign) int statuscode;

//Post WebService Methods
- (ActivationClass *) callActivationCodeService:(NSString*)params;
- (CheckUserClass *) callCheckUserService:(NSString*)params;
- (NSMutableArray *) callMobileSearchService:(NSString*)params;
- (void) callNieuwsWebService:(NSString*)params:(NSString*)selectButtonTag;
- (NSMutableArray *) callFileSaveWebService:(NSString*)params;
- (NSMutableArray *) callContactenClassService:(NSString*)params;
- (NSMutableArray *) callWikiParentWebService:(NSString*)params;
- (NSMutableArray *) callWikiChildWebService:(NSString*)params;
- (ContactViewDetails *) callContactDetailsWebService:(NSString*)params;
- (NSData *) callWikiSearchWebService:(NSString*)params;
- (void) callWikiDescriptionService:(NSString*)params;
- (NSString *) stringByStrippingHTML :(NSString *)str;
- (NSString *) stringByStrippingHTML1 :(NSString *)str;
- (NSString *) stringByStrippingHTML2 :(NSString *)str;
-(NSString*) callCheckDeviceService:(NSString*)params;
//Convert special chars
- (NSString *)kv_decodeHTMLCharacterEntities;
- (NSMutableArray *) callContactenClassServiceA:(NSString*)params;
//- (NSString *)kv_encodeHTMLCharacterEntities;
@end

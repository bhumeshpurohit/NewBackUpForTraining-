
//
//  WebService.m
//  SampleXmlParseService
//
//  Created by Etisbew on 06/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebService.h"

@implementation WebService
@synthesize newsTocusArray, tempArray, tempIdArray,wikiIdArray, statuscode, tempDict ,summarytempArray;
@synthesize newssummaryArray;
@synthesize newsAuthorArray,newstitleArray,newsDateArray,newsImageArray;
@synthesize tempnewsAuthorArray,tempnewstitleArray,tempnewsDateArray,tempnewsImageArray;
@synthesize newsIdArray,newuserIdArray;
@synthesize tempnewsIdArray,tempnewuserIdArray;
@synthesize tempvalueArray,valueArray,strResponse,newsResponseString,contactsResponseString,wikiResponseString;

 NSString *urlAddress=@"http://apps.portalcms.info/mobile_update/mobileService.cfc?";

//Activation Code Webservice
- (ActivationClass*)callActivationCodeService:(NSString*)params
{
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
            portalCMSUrl = [NSURL URLWithString:[urlAddress stringByAppendingString:params]];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
            [request setHTTPMethod:@"POST"];
            [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
            responseActivationData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *strActivationResult = [[NSString alloc]initWithData:responseActivationData encoding:NSASCIIStringEncoding];
            responseActivationData=[strActivationResult dataUsingEncoding:NSUTF8StringEncoding];
            arrayActivationDetails=[[NSMutableArray alloc]init];
            parserActivationClass = [[NSXMLParser alloc]initWithData:responseActivationData];
            parserActivationClass.delegate = self;
            [parserActivationClass parse];
    }
    return tempActivationClass;
}
//Check Device
-(NSString*) callCheckDeviceService:(NSString*)params{
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        NSHTTPURLResponse *response;
        NSError *err;
        responseCheckUserData =[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        statuscode = [response statusCode];
        if (statuscode == 200)
        {
            
            NSString *strCheckUserResult = [[NSString alloc]initWithData:responseCheckUserData encoding:NSASCIIStringEncoding];
            responseCheckUserData=[strCheckUserResult dataUsingEncoding:NSUTF8StringEncoding];
            CheckUserArray = [[NSMutableArray alloc]init];
            
            checkUserClassParser = [[NSXMLParser alloc]initWithData:responseCheckUserData];
            checkUserClassParser.delegate = self;
            [checkUserClassParser parse];
            return strCheckUserResult;
        }
    }
    return nil;
}


//Login Webservice
- (CheckUserClass*) callCheckUserService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
    portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
    [request setHTTPMethod:@"POST"];
	[request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    NSHTTPURLResponse *response;
    NSError *err;
    responseCheckUserData =[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    statuscode = [response statusCode];
    if (statuscode == 200)
    {
        
        
        NSString *strCheckUserResult = [[NSString alloc]initWithData:responseCheckUserData encoding:NSASCIIStringEncoding];
        responseCheckUserData=[strCheckUserResult dataUsingEncoding:NSUTF8StringEncoding];
        CheckUserArray = [[NSMutableArray alloc]init];
        checkUserClassParser = [[NSXMLParser alloc]initWithData:responseCheckUserData];
        checkUserClassParser.delegate = self;
        [checkUserClassParser parse];
        return tempCheckUserClass;
    }
 }
     return nil;
}

//Search service Service
- (NSMutableArray *) callMobileSearchService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
    portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
    [request setHTTPMethod:@"POST"];
	[request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    responseMobileSearchData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *strMobileSearchResult = [[NSString alloc]initWithData:responseMobileSearchData encoding:NSASCIIStringEncoding];
    responseMobileSearchData = [strMobileSearchResult dataUsingEncoding:NSUTF8StringEncoding];
	MobileSearchArray = [[NSMutableArray alloc]init];
	MobileSearchParser = [[NSXMLParser alloc]initWithData:responseMobileSearchData];
	MobileSearchParser.delegate = self;
	[MobileSearchParser parse];
    }
    return MobileSearchArray;
}

- (NSString *) stringByStrippingHTML :(NSString *)str {
    NSRange r;
    NSString *s = [str copy];
//    while ((r = [s rangeOfString:@"<img[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
//        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

- (NSString *) stringByStrippingHTML2 :(NSString *)str {
    NSRange r;
    NSString *s = [str copy];
    while ((r = [s rangeOfString:@"<a[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}


- (NSString *) stringByStrippingHTML1 :(NSString *)str {
    NSRange r;
    NSString *s = [str copy];
    while ((r = [s rangeOfString:@"<p[^>]>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
      s = [s stringByReplacingOccurrencesOfString:@"&amp"  withString:@""];
    return s;
}


//Niews web service
- (void) callNieuwsWebService:(NSString*)params:(NSString*)selectButtonTag {
        UIAppDelegate.isNetworkIsAvailable=NO;
        [UIAppDelegate internetStatus];
        [UIAppDelegate localWifi];
        if(UIAppDelegate.isNetworkIsAvailable==NO)
        {
            if([selectButtonTag isEqualToString:@"Blogs"]){
                UIAppDelegate.blogsTitleArray = UIAppDelegate.tempblogsTitleArray;
                UIAppDelegate.blogsTocusArray = UIAppDelegate.tempblogsTocusArray;
                UIAppDelegate.blogssummaryArray =  UIAppDelegate.tempblogssummaryArray;
                UIAppDelegate.blogsAuthorArray = UIAppDelegate.tempblogsAuthorArray;
                UIAppDelegate.blogsDateArray = UIAppDelegate.tempblogsDateArray;
                UIAppDelegate.blogsImageArray = UIAppDelegate.tempblogsImageArray;
                UIAppDelegate.blogsIdArray = UIAppDelegate.tempblogsIdArray;
                UIAppDelegate.blogsUserIdArray = UIAppDelegate.tempblogsUserIdArray;
            }
            else if([selectButtonTag isEqualToString:@"Nieuws"]){
                UIAppDelegate.newstitleArray = UIAppDelegate.tempnewsTitleArray;
                UIAppDelegate.newsTocusArray = UIAppDelegate.tempnewsTocusArray;
                UIAppDelegate.newssummaryArray =  UIAppDelegate.tempnewssummaryArray;
                UIAppDelegate.newsAuthorArray = UIAppDelegate.tempnewsAuthorArray;
                UIAppDelegate.newsDateArray = UIAppDelegate.tempnewsDateArray;
                UIAppDelegate.newsImageArray = UIAppDelegate.tempnewsImageArray;
                UIAppDelegate.newsIdArray = UIAppDelegate.tempnewsIdArray;
                UIAppDelegate.newsuserIdArray = UIAppDelegate.tempnewsUserIdArray;
            }
            UIAlertView  *alertNetwork = [[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertNetwork show];
        }
        else {
            portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
            [request setHTTPMethod:@"POST"];
            [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
            responseNieuwsData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *nieuwsResultString = [[NSString alloc]initWithData:responseNieuwsData encoding:NSASCIIStringEncoding];
            nieuwsResultString = [[NSString alloc]initWithData:responseNieuwsData encoding:NSUTF8StringEncoding];
            nieuwsResultString = [nieuwsResultString stringByReplacingOccurrencesOfString:@"<BR>"  withString:@""];
            nieuwsResultString = [nieuwsResultString stringByReplacingOccurrencesOfString:@"</BR>"  withString:@""];
            nieuwsResultString = [nieuwsResultString stringByReplacingOccurrencesOfString:@"<Br>"  withString:@""];
            nieuwsResultString = [nieuwsResultString stringByReplacingOccurrencesOfString:@"</Br>"  withString:@""];
            nieuwsResultString = [nieuwsResultString stringByReplacingOccurrencesOfString:@"<br />"  withString:@""];
           nieuwsResultString = [nieuwsResultString stringByReplacingOccurrencesOfString:@"â"  withString:@"'"];
            NSString *doubleTrimmed = [nieuwsResultString stringByReplacingOccurrencesOfString:@"[ \r\n\t]+" withString:@" " options:NSRegularExpressionSearch range:NSMakeRange(0, nieuwsResultString.length)];
            NSString *foundationTrimmed = [doubleTrimmed stringByReplacingOccurrencesOfString:@"^[ \r\n\t]+(.*)[ \r\n\t]+$" withString:@"$1" options:NSRegularExpressionSearch range:NSMakeRange(0, doubleTrimmed.length)];
            foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"&nbsp;"  withString:@""];
            foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:
                                 @"<html xmlns=\"\">" withString:@""];
            if([selectButtonTag isEqualToString:@"Blogs"]) {
                foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<p>"  withString:@""];
                foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</p>"  withString:@""];
            }
            foundationTrimmed = [foundationTrimmed stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            //foundationTrimmed = [self stringByStrippingHTML:foundationTrimmed];
            //foundationTrimmed = [self stringByStrippingHTML1:foundationTrimmed];
         
            //geting the response tag response
            NSString *str = foundationTrimmed;
            NSArray *tempArrays1=[[NSArray alloc]init];
            NSArray *temps1=[[NSArray alloc]init];
            NSString* temptexts1;
            NSString* newsTocusStrings1;
            tempArrays1=[str componentsSeparatedByString:@"<response>"];
            if([tempArrays1 count]>1){
                temptexts1=[tempArrays1 objectAtIndex:1];
                newsTocusStrings1=[tempArrays1 objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[tempArrays1 count];i++){
                temptexts1=[tempArrays1 objectAtIndex:i];
                temps1=[temptexts1 componentsSeparatedByString:@"</response>"];
                self.newsResponseString = [temps1 objectAtIndex:0];
            }
            
            //geting the count tag response
            NSArray *tempArrays=[[NSArray alloc]init];
            NSArray *temps=[[NSArray alloc]init];
            NSString* temptexts;
            NSString* newsTocusStrings;
            tempArrays=[str componentsSeparatedByString:@"<count>"];
            if([tempArrays count]>1){
                temptexts=[tempArrays objectAtIndex:1];
                newsTocusStrings=[tempArrays objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[tempArrays count];i++){
                temptexts=[tempArrays objectAtIndex:i];
                temps=[temptexts componentsSeparatedByString:@"</count>"];
               UIAppDelegate.countString = [temps objectAtIndex:0];
            }
            
            //geting the newstocus tag response
            self.tempArray=[[NSArray alloc]init];
            NSArray *temp2=[[NSArray alloc]init];
            NSString* aText;
            self.newsTocusArray=[[NSMutableArray alloc]init];
            NSString* temptext;
            NSString* newsTocusString;
            self.tempArray=[str componentsSeparatedByString:@"<newstocus>"];
                if([self.tempArray count]>1){
                temptext=[self.tempArray objectAtIndex:1];
                newsTocusString=[self.tempArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.tempArray count];i++){
                temptext=[self.tempArray objectAtIndex:i];
                temp2=[temptext componentsSeparatedByString:@"</newstocus>"];
                aText=@"<newstocus>";
                aText=[aText stringByAppendingString:[temp2 objectAtIndex:0]];
                aText=[aText stringByAppendingString:@"</newstocus>"];
                [self.newsTocusArray addObject:aText];
            }
            /**********************************************/
            if([UIAppDelegate.newsTocusArray count]==0)
                UIAppDelegate.newsTocusArray = self.newsTocusArray;
            else {
                for(int i=0;i<[self.newsTocusArray count];i++){
                    [UIAppDelegate.newsTocusArray addObject:[self.newsTocusArray objectAtIndex:i]];
                }
            }
            
            //geting the newssummary tag response
            self.summarytempArray = [[NSArray alloc]init];
            NSArray *summarytemp2=[[NSArray alloc]init];
            NSString* summaryaText;
            self.newssummaryArray=[[NSMutableArray alloc]init];
            NSString* summarytemptext;
            NSString* newsummaryString;
            self.summarytempArray=[str componentsSeparatedByString:@"<newssummary>"];
            if([self.summarytempArray count]>1){
                summarytemptext=[self.summarytempArray objectAtIndex:1];
                newsummaryString=[self.summarytempArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.summarytempArray count];i++){
                summarytemptext=[self.summarytempArray objectAtIndex:i];
                summarytemp2=[summarytemptext componentsSeparatedByString:@"</newssummary>"];
                summaryaText=@"";
                summaryaText=[summaryaText stringByAppendingString:[summarytemp2 objectAtIndex:0]];
                [self.newssummaryArray addObject:summaryaText];
            }
            /**********************************************/
            if([UIAppDelegate.newssummaryArray count]==0)
                UIAppDelegate.newssummaryArray = self.newssummaryArray;
            else {
                for(int i=0;i<[self.newssummaryArray count];i++){
                    [UIAppDelegate.newssummaryArray addObject:[self.newssummaryArray objectAtIndex:i]];
                }
            }
           
            //geting the newstitle tag response
            self.tempnewstitleArray = [[NSArray alloc]init];
            NSArray *titletemp2=[[NSArray alloc]init];
            NSString* titleaText;
            self.newstitleArray=[[NSMutableArray alloc]init];
            NSString* titletemptext;
            NSString* newstitleString;
            self.tempnewstitleArray=[str componentsSeparatedByString:@"<newstitle>"];
            if([self.tempnewstitleArray count]>1){
                titletemptext=[self.tempnewstitleArray objectAtIndex:1];
                newstitleString =[self.tempnewstitleArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.tempnewstitleArray count];i++){
                titletemptext=[self.tempnewstitleArray objectAtIndex:i];
                titletemp2=[titletemptext componentsSeparatedByString:@"</newstitle>"];
                titleaText=@"";
                titleaText=[titleaText stringByAppendingString:[titletemp2 objectAtIndex:0]];
                [self.newstitleArray addObject:titleaText];
            }
            /**********************************************/
            if([UIAppDelegate.newstitleArray count]==0)
                UIAppDelegate.newstitleArray = self.newstitleArray;
           
            else {
                   for(int i=0;i<[self.newstitleArray count];i++){
                    [UIAppDelegate.newstitleArray addObject:[self.newstitleArray objectAtIndex:i]];
                }
            }
        
            //geting the newsauthor tag response
            self.tempnewsAuthorArray = [[NSArray alloc]init];
            NSArray *authortemp2=[[NSArray alloc]init];
            NSString* authoraText;
            self.newsAuthorArray=[[NSMutableArray alloc]init];
            NSString* authortemptext;
            NSString* authorString;
            self.tempnewsAuthorArray=[str componentsSeparatedByString:@"<newsauthor>"];
            if([self.tempnewsAuthorArray count]>1){
                authortemptext=[self.tempnewsAuthorArray objectAtIndex:1];
                authorString =[self.tempnewsAuthorArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.tempnewsAuthorArray count];i++){
                authortemptext=[self.tempnewsAuthorArray objectAtIndex:i];
                authortemp2=[authortemptext componentsSeparatedByString:@"</newsauthor>"];
                authoraText=@"";
                authoraText=[authoraText stringByAppendingString:[authortemp2 objectAtIndex:0]];
                [self.newsAuthorArray addObject:authoraText];
            }
            /**********************************************/
            if([UIAppDelegate.newsAuthorArray count]==0)
                UIAppDelegate.newsAuthorArray = self.newsAuthorArray;
            else {
                for(int i=0;i<[self.newsAuthorArray count];i++){
                    [UIAppDelegate.newsAuthorArray addObject:[self.newsAuthorArray objectAtIndex:i]];
                }
            }
            
            //geting the newsdatepublished tag response
            self.tempnewsDateArray = [[NSArray alloc]init];
            NSArray *datetemp2=[[NSArray alloc]init];
            NSString* dateaText;
            self.newsDateArray=[[NSMutableArray alloc]init];
            NSString* datetemptext;
            NSString* dateString;
            self.tempnewsDateArray=[str componentsSeparatedByString:@"<newsdatepublished>"];
            if([self.tempnewsDateArray count]>1){
                datetemptext=[self.tempnewsDateArray objectAtIndex:1];
                dateString =[self.tempnewsDateArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.tempnewsDateArray count];i++){
                datetemptext=[self.tempnewsDateArray objectAtIndex:i];
                datetemp2=[datetemptext componentsSeparatedByString:@"</newsdatepublished>"];
                dateaText=@"";
                dateaText=[dateaText stringByAppendingString:[datetemp2 objectAtIndex:0]];
                [self.newsDateArray addObject:dateaText];
            }
            /**********************************************/
            if([UIAppDelegate.newsDateArray count]==0)
                UIAppDelegate.newsDateArray = self.newsDateArray;
            else {
                for(int i=0;i<[self.newsDateArray count];i++){
                    [UIAppDelegate.newsDateArray addObject:[self.newsDateArray objectAtIndex:i]];
                }
            }
            
            //geting the newssummaryimage tag response
            self.tempnewsImageArray = [[NSArray alloc]init];
            NSArray *imagetemp2=[[NSArray alloc]init];
            NSString* imageaText;
            self.newsImageArray=[[NSMutableArray alloc]init];
            NSString* imagetemptext;
            NSString* imageString;
            self.tempnewsImageArray=[str componentsSeparatedByString:@"<newssummaryimage>"];
            if([self.tempnewsImageArray count]>1){
                imagetemptext=[self.tempnewsImageArray objectAtIndex:1];
                imageString =[self.tempnewsImageArray objectAtIndex:0];
            }
            for(int i=1;i<[self.tempnewsImageArray count];i++){
                imagetemptext=[self.tempnewsImageArray objectAtIndex:i];
                imagetemp2=[imagetemptext componentsSeparatedByString:@"</newssummaryimage>"];
                imageaText=@"";
                imageaText=[imageaText stringByAppendingString:[imagetemp2 objectAtIndex:0]];
                [self.newsImageArray addObject:imageaText];
            }
            
            if([UIAppDelegate.newsImageArray count]==0)
                UIAppDelegate.newsImageArray = self.newsImageArray;
            else {
                for(int i=0;i<[self.newsImageArray count];i++){
                    [UIAppDelegate.newsImageArray addObject:[self.newsImageArray objectAtIndex:i]];
                }
            }
       
            //geting the newsid tag response
            self.tempnewsIdArray = [[NSArray alloc]init];
            NSArray *newsidtemp2=[[NSArray alloc]init];
            NSString* newsidaText;
            self.newsIdArray=[[NSMutableArray alloc]init];
            NSString* newsidtemptext;
            NSString* newsidString;
            self.tempnewsIdArray=[str componentsSeparatedByString:@"<newsid>"];
            if([self.tempnewsIdArray count]>1){
                newsidtemptext=[self.tempnewsIdArray objectAtIndex:1];
                newsidString =[self.tempnewsIdArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.tempnewsIdArray count];i++){
                newsidtemptext=[self.tempnewsIdArray objectAtIndex:i];
                newsidtemp2=[newsidtemptext componentsSeparatedByString:@"</newsid>"];
                newsidaText=@"";
                newsidaText=[newsidaText stringByAppendingString:[newsidtemp2 objectAtIndex:0]];
                [self.newsIdArray addObject:newsidaText];
            }
            /**********************************************/
            if([UIAppDelegate.newsIdArray count]==0)
                UIAppDelegate.newsIdArray = self.newsIdArray;
            else {
                for(int i=0;i<[self.newsIdArray count];i++){
                    [UIAppDelegate.newsIdArray addObject:[self.newsIdArray objectAtIndex:i]];
                }
            }
            
            //geting the newsuserid tag response
            self.tempnewuserIdArray = [[NSArray alloc]init];
            NSArray *newsuseridtemp2=[[NSArray alloc]init];
            NSString* newsuseridaText;
            self.newuserIdArray=[[NSMutableArray alloc]init];
            NSString* newsuseridtemptext;
            NSString* newsuseridString;
            self.tempnewuserIdArray=[str componentsSeparatedByString:@"<newsuserid>"];
            if([self.tempnewuserIdArray count]>1){
                newsuseridtemptext=[self.tempnewuserIdArray objectAtIndex:1];
                newsuseridString =[self.tempnewuserIdArray objectAtIndex:0];
            }
            /**********************************************/
            for(int i=1;i<[self.tempnewuserIdArray count];i++){
                newsuseridtemptext=[self.tempnewuserIdArray objectAtIndex:i];
                newsuseridtemp2=[newsuseridtemptext componentsSeparatedByString:@"</newsuserid>"];
                newsuseridaText=@"";
                newsuseridaText=[newsuseridaText stringByAppendingString:[newsuseridtemp2 objectAtIndex:0]];
                [self.newuserIdArray addObject:newsuseridaText];
            }
            /**********************************************/
            if([UIAppDelegate.newsuserIdArray count]==0)
                UIAppDelegate.newsuserIdArray = self.newuserIdArray;
            else {
                for(int i=0;i<[self.newuserIdArray count];i++){
                    [UIAppDelegate.newsuserIdArray addObject:[self.newuserIdArray objectAtIndex:i]];
                }
            }
                if ([selectButtonTag isEqualToString:@"Blogs"])
                {
                    UIAppDelegate.tempblogsTitleArray = UIAppDelegate.newstitleArray;
                    UIAppDelegate.blogsTitleArray = UIAppDelegate.newstitleArray;
                    UIAppDelegate.tempblogsTocusArray=UIAppDelegate.newsTocusArray;
                    UIAppDelegate.blogsTocusArray = UIAppDelegate.newsTocusArray;
                    UIAppDelegate.tempblogssummaryArray = UIAppDelegate.newssummaryArray;
                    UIAppDelegate.blogssummaryArray = UIAppDelegate.newssummaryArray;
                    UIAppDelegate.tempblogsAuthorArray=UIAppDelegate.newsAuthorArray;
                    UIAppDelegate.blogsAuthorArray = UIAppDelegate.newsAuthorArray;
                    UIAppDelegate.tempblogsDateArray=UIAppDelegate.newsDateArray;
                    UIAppDelegate.blogsDateArray = UIAppDelegate.newsDateArray;
                    UIAppDelegate.tempblogsImageArray=UIAppDelegate.newsImageArray;
                    UIAppDelegate.blogsImageArray = UIAppDelegate.newsImageArray;
                    UIAppDelegate.tempblogsIdArray=UIAppDelegate.newsIdArray;
                    UIAppDelegate.blogsIdArray = UIAppDelegate.newsIdArray;
                    UIAppDelegate.tempblogsUserIdArray=UIAppDelegate.newsuserIdArray;
                    UIAppDelegate.blogsUserIdArray = UIAppDelegate.newsuserIdArray;
                }
            
            else if ([selectButtonTag isEqualToString:@"Nieuws"]) {
                    UIAppDelegate.tempnewsTitleArray = UIAppDelegate.newstitleArray;
                    UIAppDelegate.newstitleArray = UIAppDelegate.newstitleArray;
                    UIAppDelegate.tempnewsTocusArray=UIAppDelegate.newsTocusArray;
                    UIAppDelegate.newsTocusArray = UIAppDelegate.newsTocusArray;
                    UIAppDelegate.tempnewssummaryArray = UIAppDelegate.newssummaryArray;
                    UIAppDelegate.newssummaryArray = UIAppDelegate.newssummaryArray;
                    UIAppDelegate.tempnewsAuthorArray=UIAppDelegate.newsAuthorArray;
                    UIAppDelegate.newsAuthorArray = UIAppDelegate.newsAuthorArray;
                    UIAppDelegate.tempnewsDateArray=UIAppDelegate.newsDateArray;
                    UIAppDelegate.newsDateArray = UIAppDelegate.newsDateArray;
                    UIAppDelegate.tempnewsImageArray=UIAppDelegate.newsImageArray;
                    UIAppDelegate.newsImageArray = UIAppDelegate.newsImageArray;
                    UIAppDelegate.tempnewsIdArray=UIAppDelegate.newsIdArray;
                    UIAppDelegate.newsIdArray = UIAppDelegate.newsIdArray;
                    UIAppDelegate.tempnewsUserIdArray=UIAppDelegate.newsuserIdArray;
                    UIAppDelegate.newsuserIdArray = UIAppDelegate.newsuserIdArray;
                 }
        }
}


//Comments WebService
- (NSMutableArray *) callFileSaveWebService:(NSString*)params  {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        responseCommentsData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *strCommentsResult = [[NSString alloc]initWithData:responseCommentsData encoding:NSASCIIStringEncoding];
        strCommentsResult = [strCommentsResult stringByReplacingOccurrencesOfString:@"&nbsp;"
                                                                         withString:@""];
        strCommentsResult = [strCommentsResult stringByReplacingOccurrencesOfString:@"<p>"  withString:@""];
        strCommentsResult = [strCommentsResult stringByReplacingOccurrencesOfString:@"</p>"  withString:@""];
        strCommentsResult = [self stringByStrippingHTML:strCommentsResult];
        strCommentsResult = [self stringByStrippingHTML1:strCommentsResult];
        self.tempvalueArray = [[NSArray alloc]init];
        NSArray *valuetemp2=[[NSArray alloc]init];
        NSString* valueaText;
        self.valueArray=[[NSMutableArray alloc]init];
        NSString* valuetemptext;
        NSString* valueString;
        self.tempvalueArray=[strCommentsResult componentsSeparatedByString:@"<value>"];
        if([self.tempvalueArray count]>1){
            valuetemptext=[self.tempvalueArray objectAtIndex:1];
            valueString =[self.tempvalueArray objectAtIndex:0];
        }
        for(int i=1;i<[self.tempvalueArray count];i++){
            valuetemptext=[self.tempvalueArray objectAtIndex:i];
            valuetemp2=[valuetemptext componentsSeparatedByString:@"</value>"];
            valueaText=@"";
            valueaText=[valueaText stringByAppendingString:[valuetemp2 objectAtIndex:0]];
            [self.valueArray addObject:valueaText];
        }
        if([UIAppDelegate.valueArray count]==0)
            UIAppDelegate.valueArray = self.valueArray;
        else {
            for(int i=0;i<[self.valueArray count];i++){
                [UIAppDelegate.valueArray addObject:[self.valueArray objectAtIndex:i]];
            }
        }
        responseCommentsData = [strCommentsResult dataUsingEncoding:NSUTF8StringEncoding];
        commentsDetailsArray = [[NSMutableArray alloc]init];
        commentsParser = [[NSXMLParser alloc]initWithData:responseCommentsData];
        commentsParser.delegate = self;
        [commentsParser parse];
    }
     return commentsDetailsArray;
}

//ContactenClassService WebService
- (NSMutableArray *) callContactenClassService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else
    {
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        responseContactenClassData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *strContactenClassResult = [[NSString alloc]initWithData:responseContactenClassData encoding:NSASCIIStringEncoding];
        strContactenClassResult = [strContactenClassResult stringByReplacingOccurrencesOfString:@"&"
                                                                             withString:@""];
        responseContactenClassData = [strContactenClassResult dataUsingEncoding:NSUTF8StringEncoding];
        ContactenClassArray = [[NSMutableArray alloc]init];
        contactenClassParser = [[NSXMLParser alloc]initWithData:responseContactenClassData];
        contactenClassParser.delegate = self;
        [contactenClassParser parse];
    }
      return ContactenClassArray;
}
- (NSMutableArray *) callContactenClassServiceA:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        responseContactenClassData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *strContactenClassResult = [[NSString alloc]initWithData:responseContactenClassData encoding:NSASCIIStringEncoding];
        strContactenClassResult = [strContactenClassResult stringByReplacingOccurrencesOfString:@"&"
                                                                                     withString:@""];
        responseContactenClassData = [strContactenClassResult dataUsingEncoding:NSUTF8StringEncoding];
        ContactenClassArray = [[NSMutableArray alloc]init];
        contactenClassParser = [[NSXMLParser alloc]initWithData:responseContactenClassData];
        contactenClassParser.delegate = self;
        [contactenClassParser parse];
    }
    return ContactenClassArray;
}

// Wiki Parent Service
- (NSMutableArray *) callWikiParentWebService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        responsewikiDetailsData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *strWikiParentResult = [[NSString alloc]initWithData:responsewikiDetailsData encoding:NSASCIIStringEncoding];
        responsewikiDetailsData=[strWikiParentResult dataUsingEncoding:NSUTF8StringEncoding];
        WikiParentDetailsArray = [[NSMutableArray alloc]init];
        wikiDetailsParser = [[NSXMLParser alloc]initWithData:responsewikiDetailsData];
        wikiDetailsParser.delegate = self;
        [wikiDetailsParser parse];
    }
    return WikiParentDetailsArray;
}

 //Wiki Child Service
- (NSMutableArray *) callWikiChildWebService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
    UIAppDelegate.wikiChildArray = nil;
    portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
    [request setHTTPMethod:@"POST"];
	[request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    responsewikiChildData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *strWikiChildtResult = [[NSString alloc]initWithData:responsewikiChildData encoding:NSASCIIStringEncoding];
    strWikiChildtResult = [NSString stringWithFormat:@"<Result>%@</Result>",strWikiChildtResult];
    NSString *doubleTrimmed = [strWikiChildtResult stringByReplacingOccurrencesOfString:@"[ \r\n\t]+" withString:@" " options:NSRegularExpressionSearch range:NSMakeRange(0, strWikiChildtResult.length)];
    NSString *foundationTrimmed = [doubleTrimmed stringByReplacingOccurrencesOfString:@"^[ \r\n\t]+(.*)[ \r\n\t]+$" withString:@"$1" options:NSRegularExpressionSearch range:NSMakeRange(0, doubleTrimmed.length)]; 
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"&nbsp;"  withString:@""];
    foundationTrimmed = [foundationTrimmed stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
   
   //geting the desp tag response
    NSString *str = foundationTrimmed;
    self.tempArray  =[[NSArray alloc]init];
    NSArray *temp2=[[NSArray alloc]init];
    NSString* aText;
    self.newsTocusArray=[[NSMutableArray alloc]init];
    NSString* temptext;
    NSString* newsTocusString;
    self.tempArray=[str componentsSeparatedByString:@"<desp>"];
    if([self.tempArray count]>1){
        temptext=[self.tempArray objectAtIndex:1];
        newsTocusString=[self.tempArray objectAtIndex:0];
    }
    /**********************************************/
    for(int i=1;i<[self.tempArray count];i++){
        temptext=[self.tempArray objectAtIndex:i];
        temp2=[temptext componentsSeparatedByString:@"</desp>"];
        aText=@"<desp>";
        aText=[aText stringByAppendingString:[temp2 objectAtIndex:0]];
        aText=[aText stringByAppendingString:@"</desp>"];
        [self.newsTocusArray addObject:aText];
        UIAppDelegate.wikiChildArray = self.newsTocusArray;
    }
     
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"CategoriÃ«en"
                                                                     withString:@"Categorien"];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"&nbsp;"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"&"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<br />"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<br/>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<ul>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<li>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</ul>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<h1>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</h1>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</li>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<a"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</a>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</div>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<div>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<br>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<p>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"\""
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<div class=item_inner>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"?"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</p>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<img"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</strong>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<strong>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<table"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</table>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</td>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<td"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</font>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<font"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</tbody>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<tbody"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<span"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</span>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<em>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"</em>"
                                                                     withString:@""];
    foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"<p"
                                                                     withString:@""];
    responsewikiChildData = [foundationTrimmed dataUsingEncoding:NSUTF8StringEncoding];
	WikiChildDetailsArray = [[NSMutableArray alloc]init];
	wikiChildParser = [[NSXMLParser alloc]initWithData:responsewikiChildData];
	wikiChildParser.delegate = self;
	[wikiChildParser parse];
    }
    return WikiChildDetailsArray;
}

//Contacts Details Service
- (ContactViewDetails *) callContactDetailsWebService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
    portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
    [request setHTTPMethod:@"POST"];
	[request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    responsecontactData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *strContactResult = [[NSString alloc]initWithData:responsecontactData encoding:NSASCIIStringEncoding];
    strContactResult = [strContactResult stringByReplacingOccurrencesOfString:@"&"
                                                                         withString:@" and "];
    responsecontactData=[strContactResult dataUsingEncoding:NSUTF8StringEncoding];
	contactDetailsArray = [[NSMutableArray alloc]init];
	contactDetailsParser = [[NSXMLParser alloc]initWithData:responsecontactData];
	contactDetailsParser.delegate = self;
	[contactDetailsParser parse];
    }
    return tempContactViewDetails;
}

//wiki search Service
- (NSData *) callWikiSearchWebService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        responseWikiSearchData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *wikiSearchResults = [[NSString alloc]initWithData:responseWikiSearchData encoding:NSASCIIStringEncoding];
        wikiSearchResults = [wikiSearchResults stringByReplacingOccurrencesOfString:@"CategoriÃ«en"
                                                                         withString:@"Categorien"];
        wikiSearchResults = [NSString stringWithFormat:@"<Result>%@</Result>",wikiSearchResults];
        responseWikiSearchData=[wikiSearchResults dataUsingEncoding:NSUTF8StringEncoding];
    }
     return responseWikiSearchData;
}

// Calling the WikiDescriptionService
- (void) callWikiDescriptionService:(NSString*)params {
    UIAppDelegate.isNetworkIsAvailable=NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];
    if(UIAppDelegate.isNetworkIsAvailable==NO)
    {
        UIAlertView  *alertNetwork=[[UIAlertView alloc] initWithTitle:@"Network Status" message:ServerError delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertNetwork show];
    }
    else {
        UIAppDelegate.wikiDescString = nil;
        portalCMSUrl = [NSURL URLWithString:[UIAppDelegate.CMSUrlString stringByAppendingString:params]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:portalCMSUrl];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        responseWikiDescData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *strwikiDescription = [[NSString alloc]initWithData:responseWikiDescData encoding:NSASCIIStringEncoding];
        NSString *doubleTrimmed = [strwikiDescription stringByReplacingOccurrencesOfString:@"[ \r\n\t]+" withString:@" " options:NSRegularExpressionSearch range:NSMakeRange(0, strwikiDescription.length)];
        NSString *foundationTrimmed = [doubleTrimmed stringByReplacingOccurrencesOfString:@"^[ \r\n\t]+(.*)[ \r\n\t]+$" withString:@"$1" options:NSRegularExpressionSearch range:NSMakeRange(0, doubleTrimmed.length)];         
        foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"&nbsp;"  withString:@""];
        foundationTrimmed = [foundationTrimmed stringByReplacingOccurrencesOfString:@"&"
                                                                         withString:@""];
        foundationTrimmed = [foundationTrimmed stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        responseWikiDescData=[foundationTrimmed dataUsingEncoding:NSUTF8StringEncoding];
      
        //geting the data tag response
        NSString *str = foundationTrimmed;
        self.tempArray=[[NSArray alloc]init];
        NSArray *temp2=[[NSArray alloc]init];
        NSString* aText;
        self.newsTocusArray=[[NSMutableArray alloc]init];
        NSString* temptext;
        NSString* newsTocusString;
        self.tempArray=[str componentsSeparatedByString:@"<data>"];
        if([self.tempArray count]>1){
            temptext=[self.tempArray objectAtIndex:1];
            newsTocusString=[self.tempArray objectAtIndex:0];
        }
        /**********************************************/
        for(int i=1;i<[self.tempArray count];i++){
            temptext=[self.tempArray objectAtIndex:i];
            temp2=[temptext componentsSeparatedByString:@"</data>"];
            aText=@"<data>";
            aText=[aText stringByAppendingString:[temp2 objectAtIndex:0]];
            aText=[aText stringByAppendingString:@"</data>"];
            UIAppDelegate.wikiDescString = aText;
        }
    }
}


//replacing the special characters
- (NSString *)kv_decodeHTMLCharacterEntities :(NSString*)str {
    if ([str rangeOfString:@"&"].location == NSNotFound) {
        return str;
    } else {
        NSMutableString *escaped = [NSMutableString stringWithString:str];
        NSArray *codes = [NSArray arrayWithObjects:
                          @"&nbsp;", @"&iexcl;", @"&cent;", @"&pound;", @"&curren;", @"&yen;", @"&brvbar;",
                          @"&sect;", @"&uml;", @"&copy;", @"&ordf;", @"&laquo;", @"&not;", @"&shy;", @"&reg;",
                          @"&macr;", @"&deg;", @"&plusmn;", @"&sup2;", @"&sup3;", @"&acute;", @"&micro;",
                          @"&para;", @"&middot;", @"&cedil;", @"&sup1;", @"&ordm;", @"&raquo;", @"&frac14;",
                          @"&frac12;", @"&frac34;", @"&iquest;", @"&Agrave;", @"&Aacute;", @"&Acirc;",
                          @"&Atilde;", @"&Auml;", @"&Aring;", @"&AElig;", @"&Ccedil;", @"&Egrave;",
                          @"&Eacute;", @"&Ecirc;", @"&Euml;", @"&Igrave;", @"&Iacute;", @"&Icirc;", @"&Iuml;",
                          @"&ETH;", @"&Ntilde;", @"&Ograve;", @"&Oacute;", @"&Ocirc;", @"&Otilde;", @"&Ouml;",
                          @"&times;", @"&Oslash;", @"&Ugrave;", @"&Uacute;", @"&Ucirc;", @"&Uuml;", @"&Yacute;",
                          @"&THORN;", @"&szlig;", @"&agrave;", @"&aacute;", @"&acirc;", @"&atilde;", @"&auml;",
                          @"&aring;", @"&aelig;", @"&ccedil;", @"&egrave;", @"&eacute;", @"&ecirc;", @"&euml;",
                          @"&igrave;", @"&iacute;", @"&icirc;", @"&iuml;", @"&eth;", @"&ntilde;", @"&ograve;",
                          @"&oacute;", @"&ocirc;", @"&otilde;", @"&ouml;", @"&divide;", @"&oslash;", @"&ugrave;",
                          @"&uacute;", @"&ucirc;", @"&uuml;", @"&yacute;", @"&thorn;", @"&yuml;",nil];
        
        NSUInteger i, count = [codes count];
        // Html
        for (i = 0; i < count; i++) {
            NSRange range = [str rangeOfString:[codes objectAtIndex:i]];
            if (range.location != NSNotFound) {
                [escaped replaceOccurrencesOfString:[codes objectAtIndex:i]
                                         withString:[NSString stringWithFormat:@"%C", 160 + i]
                                            options:NSLiteralSearch
                                              range:NSMakeRange(0, [escaped length])];
            }
        }
        // The following five are not in the 160+ range
        // @"&amp;"
        NSRange range = [str rangeOfString:@"&amp;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&amp;"
                                     withString:[NSString stringWithFormat:@"%C", 38]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
            
            
        }
        
        // @"&lt;"
        range = [str rangeOfString:@"&lt;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&lt;"
                                     withString:[NSString stringWithFormat:@"%C", 60]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
            
            
        }
        
        // @"&gt;"
        range = [str rangeOfString:@"&gt;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&gt;"
                                     withString:[NSString stringWithFormat:@"%C", 62]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
            
            
        }
        
        // @"&apos;"
        range = [str rangeOfString:@"&apos;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&apos;"
                                     withString:[NSString stringWithFormat:@"%C", 39]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
            
            
        }
        
        // @"&quot;"
        range = [str rangeOfString:@"&quot;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&quot;"
                                     withString:[NSString stringWithFormat:@"%C", 34]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
            
        }
        
        // Decimal & Hex
        NSRange start, finish, searchRange = NSMakeRange(0, [escaped length]);
        i = 0;
        
        while (i < [escaped length]) {
            start = [escaped rangeOfString:@"&#"
                                   options:NSCaseInsensitiveSearch
                                     range:searchRange];
            
            finish = [escaped rangeOfString:@";"
                                    options:NSCaseInsensitiveSearch
                                      range:searchRange];
            
            if (start.location != NSNotFound && finish.location != NSNotFound &&
                finish.location > start.location) {
                NSRange entityRange = NSMakeRange(start.location, (finish.location - start.location) + 1);
                NSString *entity = [escaped substringWithRange:entityRange];
                NSString *value = [entity substringWithRange:NSMakeRange(2, [entity length] - 2)];
                
                [escaped deleteCharactersInRange:entityRange];
                
                if ([value hasPrefix:@"x"]) {
                    unsigned tempInt = 0;
                    NSScanner *scanner = [NSScanner scannerWithString:[value substringFromIndex:1]];
                    [scanner scanHexInt:&tempInt];
                    [escaped insertString:[NSString stringWithFormat:@"%C", tempInt] atIndex:entityRange.location];
                } else {
                    [escaped insertString:[NSString stringWithFormat:@"%C", [value intValue]] atIndex:entityRange.location];
                } i = start.location;
            } else { i++; }
            searchRange = NSMakeRange(i, [escaped length] - i);
        }
        return escaped;    // Note this is autoreleased
    }
}


/*
 This delegate method sent when the parser finds an element start tag.
 Parsing the Xml response
 */

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{   
    //Finds the ActivationClass element start tag
	if (parser==parserActivationClass) {
		if([elementName isEqualToString:@"Result"])
		{
          tempActivationClass=[[ActivationClass alloc]init];
		}
	} 
    
    //Finds the CheckUserClass element start tag
    if (parser==checkUserClassParser) {
		if([elementName isEqualToString:@"Result"])
		{
          tempCheckUserClass=[[CheckUserClass alloc]init];
		}
	}
    
    //Finds the MobileSearchKey element start tag
    if (parser==MobileSearchParser) {
		if([elementName isEqualToString:@"Result"])
		{
            MobileSearchArray = [[NSMutableArray alloc]init];
		}
        
        if([elementName isEqualToString:@"news"])
        {
            tempMobileSearchClass = [[MobileSearchClass alloc]init];
            tempMobileSearchClass.newsString = [attributeDict valueForKey:@"news"];
		}
	}
    
    //Finds the contactenClassParser element start tag
    if (parser==contactenClassParser) {
		
        if([elementName isEqualToString:@"Result"])
		{
            ContactenClassArray = [[NSMutableArray alloc]init];
        }
        if([elementName isEqualToString:@"usersemail"])
        {
            tempContactenClass=nil;
            tempContactenClass = [[ContactenClass alloc]init];
		}
    }
    
    //Finds the commentsParser element start tag
    if (parser==commentsParser) {
		
        if([elementName isEqualToString:@"Result"])
		{
            commentsDetailsArray = [[NSMutableArray alloc]init];
        }
        if([elementName isEqualToString:@"value"])
        {
            tempCommentsClass=nil;
            tempCommentsClass = [[CommentsClass alloc]init];
		}
    }
    
    //Finds the wikiDetailsParser element start tag
    if (parser==wikiDetailsParser) {
		
        if([elementName isEqualToString:@"Result"])
		{
            WikiParentDetailsArray = [[NSMutableArray alloc]init];
        }
        
        if([elementName isEqualToString:@"WikiId"])
        {
            tempWikiParentClass=nil;
            tempWikiParentClass = [[WikiParentClass alloc]init];
		}
    }
    
    //Finds the wikiChildParser element start tag
    if (parser==wikiChildParser) {
		
        if([elementName isEqualToString:@"Result"])
		{
            WikiChildDetailsArray = [[NSMutableArray alloc]init];
        }
        
        if([elementName isEqualToString:@"titlename"] || [elementName isEqualToString:@"name"])
        {
            tempWikiChildClass=nil;
            tempWikiChildClass = [[WikiChildClass alloc]init];
		}
    }
    
    //Finds the contactDetailsParser element start tag
    if (parser==contactDetailsParser) {
		
        if([elementName isEqualToString:@"Result"])
		{
            tempContactViewDetails=[[ContactViewDetails alloc]init];
		}
	} 
}

/*
 This delegate method returns the string of the characters encountered.
 Parsing the Xml response
 */

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{    
    //ActivationClass method returns the string of the characters
	if(parser==parserActivationClass)
	{
        stringActivationClass = [[NSString alloc]init];
        stringActivationClass = string;
	}
    
    //CheckUserClass method returns the string of the characters
    if(parser==checkUserClassParser)
	{
        checkUserClassString = [[NSString alloc]init];
        checkUserClassString = string;
	}
    
    //MobileSearchClass method returns the string of the characters
    if(parser==MobileSearchParser)
	{
        MobileSearchString = [[NSString alloc]init];
        MobileSearchString = string;
	}
    
    //MobileContactsClass method returns the string of the characters
    if(parser == contactenClassParser)
	{
        contactenClassString = [[NSString alloc]init];
        contactenClassString = string;
	}
        
    //Comments Parser method returns the string of the characters
    if(parser == commentsParser)
	{
        commentsString = [[NSString alloc]init];
        commentsString = string;
	}
    
    //Wiki Parent class method returns the string of the characters
    if(parser == wikiDetailsParser)
	{
        wikiDetailsString = [[NSString alloc]init];
        wikiDetailsString = string;
	}
    
    //Wiki Child class method returns the string of the characters
    if(parser == wikiChildParser)
	{
        wikiChildString = [[NSString alloc]init];
        wikiChildString = string;
	}
    
    //contactDetails class method returns the string of the characters
    if(parser==contactDetailsParser)
	{
        contactDetailsString = [[NSString alloc]init];
        contactDetailsString = string;
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //Compare ActivationClass Properties and get xml response
	if (parser == parserActivationClass) {
		
		if([elementName isEqualToString:@"Result"])
		{
			[arrayActivationDetails addObject:tempActivationClass];
		}
        
		if([elementName isEqualToString:@"response"])
		{
			tempActivationClass.responseString = stringActivationClass;
		}
        
		if([elementName isEqualToString:@"mobileurl"])
		{
			tempActivationClass.mobileurlString = stringActivationClass;
		}
        
        if([elementName isEqualToString:@"intraid"])
		{
			tempActivationClass.intraidString = stringActivationClass;
		}
        
        if([elementName isEqualToString:@"categorieid"])
		{
			tempActivationClass.categorieIdString = stringActivationClass;
		}
        
		if([elementName isEqualToString:@"logo"])
		{
            tempActivationClass.logoString = stringActivationClass;
        }
        
		if([elementName isEqualToString:@"mobileoptions"])
		{
			tempActivationClass.mobileOptionsString = stringActivationClass;
		}
    }
    
    //Compare CheckUserClass Properties and get xml response
    if (parser == checkUserClassParser) {
		
		if([elementName isEqualToString:@"Result"])
		{
			[CheckUserArray addObject:tempCheckUserClass];
		}
        
		if([elementName isEqualToString:@"response"])
		{
			tempCheckUserClass.responseString = checkUserClassString;
		}
        
		if([elementName isEqualToString:@"userid"])
		{
			tempCheckUserClass.userIdString = checkUserClassString;
		}
    }
    
    //Compare MobileSearchParser Properties and get xml response
    else  if(parser == MobileSearchParser) {
		if([elementName isEqualToString:@"response"])
		{
			tempMobileSearchClass.responseString = MobileSearchString;
            strResponse = tempMobileSearchClass.responseString;
            strResponse = MobileSearchString;
		}
        
        if([elementName isEqualToString:@"news"])
		{
			tempMobileSearchClass.newsString=MobileSearchString;
			[MobileSearchArray addObject:tempMobileSearchClass.newsString];
		}
	}
    
    //Compare contactenClassParser Properties and get xml response
    else  if(parser == contactenClassParser) {
		if([elementName isEqualToString:@"response"])
		{
			tempContactenClass.responseString = contactenClassString;
            UIAppDelegate.contresponseString = contactenClassString;
		}
        if([elementName isEqualToString:@"usersexpertise"])
        {
            tempContactenClass.usersExpertiseString = contactenClassString;
        }
        if([elementName isEqualToString:@"count"])
		{
            UIAppDelegate.countString = nil;
			UIAppDelegate.countString = contactenClassString;
		}
        
        if([elementName isEqualToString:@"usersemail"])
		{
			tempContactenClass.usersEmailString=contactenClassString;
		}
        
        if([elementName isEqualToString:@"usersname"])
		{
			tempContactenClass.usersNameString=contactenClassString;
		}
        
        if([elementName isEqualToString:@"usersmobile"])
		{
			tempContactenClass.usersMobileString=contactenClassString;
		}
        
        if([elementName isEqualToString:@"userstelphone"])
		{
			tempContactenClass.usersTelphoneString = contactenClassString;
		}
        
        if([elementName isEqualToString:@"usersfunctie"])
		{
			tempContactenClass.usersFunctieString=contactenClassString;
		}
        
        if([elementName isEqualToString:@"usersimage"])
		{
			tempContactenClass.usersImageString=contactenClassString;
            [ContactenClassArray addObject:tempContactenClass];
		}
	}
    
    //Compare commentsParser Properties and get xml response
    else  if(parser == commentsParser) {
        
//      if([elementName isEqualToString:@"value"])
//		{
//			tempCommentsClass.valueString = commentsString;
//		}
        
        if([elementName isEqualToString:@"dateposted"])
		{
			tempCommentsClass.datepostedString = commentsString;
		}
        
        if([elementName isEqualToString:@"userimage"])
		{
            if (commentsString!=nil) {
                tempCommentsClass.userimageString = commentsString;
            }
             [commentsDetailsArray addObject:tempCommentsClass];
		}
	}
    
    //Compare wikiDetailsParser Properties and get xml response
    else  if(parser == wikiDetailsParser) {
		if([elementName isEqualToString:@"response"])
		{
			tempWikiParentClass.responseString = wikiDetailsString;
            self.wikiResponseString = wikiDetailsString;
		}
        
        if([elementName isEqualToString:@"WikiId"])
		{
			tempWikiParentClass.WikiIdString=wikiDetailsString;
		}
        
        if([elementName isEqualToString:@"WikiCount"])
		{
			tempWikiParentClass.WikiCountString=wikiDetailsString;
		}
        
        if([elementName isEqualToString:@"WikiName"])
		{
			tempWikiParentClass.WikiNameString = wikiDetailsString;
            [WikiParentDetailsArray addObject:tempWikiParentClass];
		}
	}
    
    //Compare wikiChildParser Properties and get xml response
    else  if(parser == wikiChildParser) {
		
		if([elementName isEqualToString:@"response"])
		{
			tempWikiChildClass.responseString = wikiChildString;
		}
        
        if([elementName isEqualToString:@"titlename"]||[elementName isEqualToString:@"name"])
		{
			tempWikiChildClass.titleNameString=wikiChildString;
		}
        
        if([elementName isEqualToString:@"treeid"] ||[elementName isEqualToString:@"id"])
		{
			tempWikiChildClass.treeIdString = wikiChildString;
		}
        
        if([elementName isEqualToString:@"treeids"])
        {
            tempWikiChildClass.treeidsString = wikiChildString;
		}
        
        if([elementName isEqualToString:@"name"])
		{
			tempWikiChildClass.nameString = wikiChildString;
            [WikiChildDetailsArray addObject:tempWikiChildClass];
		}
        
        if([elementName isEqualToString:@"isparent"])
		{
			tempWikiChildClass.isParentString = wikiChildString;
		}
        
        if([elementName isEqualToString:@"children"])
        {
            tempWikiChildClass.childrenString = wikiChildString;
		}
        
        if([elementName isEqualToString:@"desp"])
		{
			tempWikiChildClass.descString = wikiChildString;
            [WikiChildDetailsArray addObject:tempWikiChildClass];
		}
	}
    
    //Compare contactDetailsParser Properties and get xml response
    else if (parser == contactDetailsParser) {
		
		if([elementName isEqualToString:@"Result"])
		{
			[ContactenClassArray addObject:tempContactViewDetails];
		}
        
		if([elementName isEqualToString:@"usersemail"])
		{
			tempContactViewDetails.usersEmailString = contactDetailsString;
		}
        
        if([elementName isEqualToString:@"usersname"])
		{
			tempContactViewDetails.usersNameString = contactDetailsString;
		}
        
        if([elementName isEqualToString:@"usersmobile"])
		{
			tempContactViewDetails.usersMobileString = contactDetailsString;
		}
        
		if([elementName isEqualToString:@"userstelphone"])
		{
            tempContactViewDetails.usersTelphoneString = contactDetailsString;
        }
        
		if([elementName isEqualToString:@"usersexpertise"])
		{
			tempContactViewDetails.usersExpertiseString = contactDetailsString;
		}
        
        if([elementName isEqualToString:@"usersfunctie"])
		{
			tempContactViewDetails.usersFunctieString = contactDetailsString;
		}
        
        if([elementName isEqualToString:@"usersimage"])
		{
			tempContactViewDetails.usersImageString = contactDetailsString;
		}
    }
}

@end
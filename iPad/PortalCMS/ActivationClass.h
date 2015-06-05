//
//  ActivationClass.h
//  SampleXmlParseService
//
//  Created by Etisbew on 06/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivationClass : NSObject {
    NSString *responseString;
    NSString *mobileurlString;
    NSString *intraidString;
    NSString *categorieIdString;
    NSString *logoString;
    NSString *mobileOptionsString;
}
@property (nonatomic,strong) NSString *responseString;
@property (nonatomic,strong) NSString *mobileurlString; 
@property (nonatomic,strong) NSString *intraidString; 
@property (nonatomic,strong) NSString *categorieIdString; 
@property (nonatomic,strong) NSString *logoString;
@property (nonatomic,strong) NSString *mobileOptionsString;
@end

//
//  FMDBDataAccess.h
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h" 
#import "FMResultSet.h" 
#import "Utility.h" 

@interface FMDBDataAccess : NSObject
{
    
}

-(NSMutableArray *) getCustomers; 
-(BOOL) insertuserData:(NSMutableDictionary *)dictData;
-(BOOL)checkUserLogin:(NSString *)userName andPassword:(NSString *)password;
-(BOOL) insertclientData:(NSMutableDictionary *)dictData;
-(BOOL) updateclientData:(NSMutableDictionary *)dictData;
-(NSMutableArray *) getClient;
-(BOOL)deleteclientData:(NSInteger)clientID;
@end

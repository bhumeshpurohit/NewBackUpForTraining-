//
//  DataBaseHelper.m
//  JobManagement
//
//  Created by Ravi on 27/11/13.
//  Copyright (c) 2013 Aarin. All rights reserved.
//

#import "DataBaseHelper.h"
#import <sqlite3.h>
#import "FMDatabase.h"
#import "AppDelegate.h"



@implementation DataBaseHelper


-(NSMutableArray*)getproductlistFromProductType:(int)indexValue{

    NSMutableArray *output=[[NSMutableArray alloc]init];

    FMDatabase *db = [FMDatabase databaseWithPath:[(AppDelegate*)[[UIApplication sharedApplication]delegate] databasePath]];

    [db open];
    NSString * query = [NSString stringWithFormat:@"SELECT * FROM PRODUCT_DEC where PRODUCT_CAT_ID = %d",indexValue];

    FMResultSet *results = [db executeQuery:query];

    while ([results next]) {
        [output addObject:[results resultDictionary]];

    }

    [db close];

    return output;
}



-(NSMutableArray*)getproductImage:(NSString *)productDescName {

    NSMutableArray *output=[[NSMutableArray alloc]init];

    FMDatabase *db = [FMDatabase databaseWithPath:[(AppDelegate*)[[UIApplication sharedApplication]delegate] databasePath]];

    [db open];
   
    
    
    
    
    NSString * query = [NSString stringWithFormat:@"SELECT * FROM PRODUCTIMAGES where PRODUCT_DEC_NAME = '%@'",productDescName];

    FMResultSet *results = [db executeQuery:query];

    while ([results next]) {
        NSLog(@":- %@",results);
        [output addObject:[results resultDictionary]];

    }

    [db close];
    
    return output;
}
-(void)getdata
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"proPad.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
    NSString *query = [NSString stringWithFormat:@"insert into UserInfo values ('%@','%@','%@','%@','%@','%@','%@')", @"test1", @"test2",@"test1",@"test1",@"test1",@"test1",@"test1"];
    [database executeUpdate:query];
    
    
    
    FMResultSet *results = [database executeQuery:@"select * from UserInfo"];
    while([results next]) {
        NSString *name = [results stringForColumn:@"FirstName"];
        NSString *age  = [results stringForColumn:@"LastName"];
        NSLog(@"User: %@ - %@",name, age);
    }
    [database close];

    
    
    
    
}




@end
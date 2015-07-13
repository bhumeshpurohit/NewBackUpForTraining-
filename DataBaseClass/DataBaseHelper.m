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
//        [results setValue:[results stringForColumn:@"DESCRIPTION"] forKey:@"DESCRIPTION"];
//        [results setValue:[results stringForColumn:@"NAME"] forKey:@"NAME"];
//        [results setValue:[results stringForColumn:@"PRODUCT_DEC_ID"] forKey:@"PRODUCT_DEC_ID"];
//        [results setValue:[results stringForColumn:@"PRODUCT_DEC_NAME"] forKey:@"PRODUCT_DEC_NAME"];
        NSLog(@":- %@",results);
        [output addObject:[results resultDictionary]];

    }

    [db close];
    
    return output;
}


@end
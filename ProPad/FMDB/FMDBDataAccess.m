//
//  FMDBDataAccess.m
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import "FMDBDataAccess.h"

@implementation FMDBDataAccess


/*-(BOOL) update{
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE customers SET firstname = '%@', lastname = '%@' where id = %d",customer.firstName,customer.lastName,customer.customerId]];
    
    [db close];
    
    return success; 
}*/

-(BOOL) insertuserData:(NSMutableDictionary *)dictData{
    // insert customer into database
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success =  [db executeUpdate:@"insert into userdata  VALUES (?,?,?,?,?,?,?);",[dictData valueForKey:@"firstName"], [dictData valueForKey:@"Lastname"],[dictData valueForKey:@"Username"],[dictData valueForKey:@"Secretpin"],[dictData valueForKey:@"company_code"],[dictData valueForKey:@"Company_Name"],[dictData valueForKey:@"salesPersonType"]];
    
    [db close];
    
    return success; 
    
    return YES; 
}

//-(NSMutableArray *) getCustomers
//{
//    NSMutableArray *customers = [[NSMutableArray alloc] init];
//    
//    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
//    
//    [db open];
//    
//    FMResultSet *results = [db executeQuery:@"select * from userdata"];
//    
//    while([results next]) 
//    {
//        NSString *name = [results stringForColumn:@"firstName"];
//        NSString *age  = [results stringForColumn:@"lastName"];
//        NSLog(@"User: %@ - %@",name, age);
//        
//    }
//    
//    [db close];
//  
//    return customers; 
//
//}
-(NSMutableArray *) getClient
{
    NSMutableArray *client=[[NSMutableArray alloc]init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    FMResultSet *results = [db executeQuery:@"select * from clientdatabase"];
    
    while([results next])
    {
        NSDictionary *d=@{@"ClientID":[results stringForColumn:@"ClientID"],@"CustType":[results stringForColumn:@"CustType"],
        @"Reference":[results stringForColumn:@"Reference"],
                          @"FirstName":[results stringForColumn:@"FirstName"],
                          @"LastName":[results stringForColumn:@"LastName"],
                          @"Address":[results stringForColumn:@"Address"],
                          @"City":[results stringForColumn:@"City"],
                          @"Zip":[results stringForColumn:@"Zip"],
                          @"Mobile":[results stringForColumn:@"Mobile"],
                          @"Home":[results stringForColumn:@"Home"],
                          @"Work":[results stringForColumn:@"Work"],
                          @"Email":[results stringForColumn:@"Email"],
                          @"PreferContType":[results stringForColumn:@"PreferContType"],
                          @"NotesforClient":[results stringForColumn:@"NotesforClient"],
                          @"MakeModal":[results stringForColumn:@"MakeModal"],
                          @"CurrentMile":[results stringForColumn:@"CurrentMile"],
                          @"CurrentmonthlyPayment":[results stringForColumn:@"CurrentmonthlyPayment"],
                          @"DesiremonthlyPayment":[results stringForColumn:@"DesiremonthlyPayment"],
                          @"NotesForVehicle":[results stringForColumn:@"NotesForVehicle"],
                          @"PrimaryChoice":[results stringForColumn:@"PrimaryChoice"],
                          @"SecondaryChoice":[results stringForColumn:@"SecondaryChoice"],
                          @"RegistrationDate":[results stringForColumn:@"RegistrationDate"]};
            [client addObject:d];
    
                          
      /*  NSString *a = [results stringForColumn:@"CustType"];
        NSString *b  = [results stringForColumn:@"Reference"];
        NSString *c = [results stringForColumn:@"FirstName"];
        NSString *d  = [results stringForColumn:@"LastName"];
        NSString *e = [results stringForColumn:@"Address"];
        NSString *f  = [results stringForColumn:@"City"];
        NSString *g = [results stringForColumn:@"Zip"];
        NSString *h  = [results stringForColumn:@"Mobile"];
        NSString *i = [results stringForColumn:@"Home"];
        NSString *j  = [results stringForColumn:@"Work"];
        NSString *k = [results stringForColumn:@"Email"];
        NSString *l  = [results stringForColumn:@"PreferContType"];
        NSString *m = [results stringForColumn:@"NotesforClient"];
        NSString *n  = [results stringForColumn:@"MakeModal"];
        NSString *o = [results stringForColumn:@"CurrentMile"];
        NSString *p  = [results stringForColumn:@"CurrentmonthlyPayment"];
        NSString *q  = [results stringForColumn:@"DesiremonthlyPayment"];
         NSString *r  = [results stringForColumn:@"NotesForVehicle"];
         NSString *s  = [results stringForColumn:@"PrimaryChoice"];
         NSString *t  = [results stringForColumn:@"SecondaryChoice"];
        
        
        NSLog(@"User: %@ - %@ %@ - %@ %@ - %@ %@ - %@ %@ - %@ %@ - %@ %@ - %@ %@ - %@ %@ - %@ %@ -%@ ",a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t);*/
        
        
        
    }
    
    [db close];
    
    return client;
    
}

-(BOOL)checkUserLogin:(NSString *)userName andPassword:(NSString *)password {
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    FMResultSet *results = [db executeQuery:[NSString stringWithFormat:@"select * from userdata where userName='%@' and password='%@'",userName,password]];
    
    while([results next])
    {
        return TRUE;
    }
    
    [db close];
    return FALSE;

}
-(BOOL)deleteclientData:(NSInteger)clientID
{
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    [db open];
    NSString *insertQuery = [NSString stringWithFormat:@"DELETE FROM clientdatabase WHERE ClientID = %ld", (long)clientID];
    BOOL success=[db executeUpdate:insertQuery];
    
    return success;
}
-(BOOL) updateclientData:(NSMutableDictionary *)dictData
{
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    [db open];
    
    
//    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE clientdatabase SET name = '%@', phone = '%@', address = '%@', email = '%@', notes = '%@' WHERE id = %d", client.Name, client.Phone, client.Address, client.Email, client.Notes, client.clientId]];

    
    //    BOOL success =  [db executeUpdate:@"INSERT INTO clientdata (CustType,Reference) VALUES('abc','123');"];UPDATE clientdatabase SET Address
 
    NSInteger prefTypeInt = [[dictData valueForKey:@"PreferContType"] intValue];
    NSNumber *prefType =    [NSNumber numberWithInt:(int)prefTypeInt];
    NSString *insertQuery = [NSString stringWithFormat:@"UPDATE clientdatabase SET Address = %@, City = %@,CurrentMile = %@,CurrentmonthlyPayment = %@,CustType = %@,DesiremonthlyPayment = %@,Email = %@,FirstName = %@,Home = %@,LastName = %@,Mobile = %@,NotesForVehicle = %@,NotesforClient = %@,PreferContType = %@,PrimaryChoice = %@,Reference = %@,RegistrationDate = %@,SecondaryChoice = %@,Work = %@,Zip = %@ WHERE ClientID = %d",
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Address"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"City"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CurrentMile"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CurrentmonthlyPayment"]],
                              [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CustType"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"DesiremonthlyPayment"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Email"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"FirstName"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Home"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"LastName"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Mobile"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"NotesForVehicle"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"NotesforClient"]],
                             prefType,
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"PrimaryChoice"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Reference"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"RegistrationDate"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"SecondaryChoice"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Work"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Zip"]],
                             [[dictData valueForKey:@"ClientID"] intValue]
                             ];
    //    NSString *originalUrl = insertQuery;
    //    insertQuery = [originalUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
    BOOL success = [db executeUpdate:insertQuery];
    
        /*
    NSInteger prefTypeInt = [[dictData valueForKey:@"PreferContType"] intValue];
    NSNumber *prefType =    [NSNumber numberWithInt:(int)prefTypeInt];
    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE clientdatabase SET Address = '%@', City = '%@',CurrentMile = '%@',CurrentmonthlyPayment = '%@',CustType = '%@',DesiremonthlyPayment = '%@',Email = '%@',FirstName = '%@',Home = '%@',LastName = '%@',MakeModal = '%@',Mobile = '%@',NotesForVehicle = '%@',NotesforClient = '%@',PreferContType = '%@',PrimaryChoice = '%@',Reference = '%@',RegistrationDate = '%@',SecondaryChoice = '%@',Work = '%@',Zip = '%@'where ClientID = %d",
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Address"],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"City"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CurrentMile"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CurrentmonthlyPayment"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CustType"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"DesiremonthlyPayment"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Email"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"FirstName"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Home"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"LastName"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"MakeModal"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Mobile"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"NotesForVehicle"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"NotesforClient"]],
                                      prefType,
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"PrimaryChoice"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Reference"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"RegistrationDate"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"SecondaryChoice"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Work"]],
                                      [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Zip"]],
                                      [[dictData valueForKey:@"ClientID"]intValue]]]];*/
    
    [db close];
    //return true;
    return success;
}

-(BOOL) insertclientData:(NSMutableDictionary *)dictData{
    // insert customer into database
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    [db open];
    //    BOOL success =  [db executeUpdate:@"INSERT INTO clientdata (CustType,Reference) VALUES('abc','123');"];
    NSInteger prefTypeInt = [[dictData valueForKey:@"PreferContType"] intValue];
    NSNumber *prefType =    [NSNumber numberWithInt:(int)prefTypeInt];
    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO %@ (Address,City,CurrentMile,CurrentmonthlyPayment,CustType,DesiremonthlyPayment,Email,FirstName,Home,LastName,MakeModal,Mobile,NotesForVehicle,NotesforClient,PreferContType,PrimaryChoice,Reference,RegistrationDate,SecondaryChoice,Work,Zip) VALUES (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@);",@"clientdatabase",
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Address"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"City"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CurrentMile"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CurrentmonthlyPayment"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"CustType"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"DesiremonthlyPayment"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Email"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"FirstName"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Home"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"LastName"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"MakeModal"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Mobile"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"NotesForVehicle"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"NotesforClient"]],
                             prefType,
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"PrimaryChoice"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Reference"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"RegistrationDate"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"SecondaryChoice"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Work"]],
                             [NSString stringWithFormat:@"'%@'",[dictData valueForKey:@"Zip"]]
                             
                             ];
    //    NSString *originalUrl = insertQuery;
    //    insertQuery = [originalUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
    BOOL success = [db executeUpdate:insertQuery, nil];
    
    /* BOOL success =  [db executeUpdate:@"INSERT INTO clientdatabase (CustType,Reference,FirstName,Lastname,Address,City,Zip,Mobile,Home,Work,Email,NotesforClient,MakeModal,) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
     [dictData valueForKey:@"CustType"],
     [dictData valueForKey:@"Reference"],
     [dictData valueForKey:@"FirstName"],
     [dictData valueForKey:@"Lastname"],
     [dictData valueForKey:@"Address"],
     [dictData valueForKey:@"City"],
     [dictData valueForKey:@"Zip"],
     [dictData valueForKey:@"Mobile"],
     [dictData valueForKey:@"Home"],
     [dictData valueForKey:@"Work"],
     [dictData valueForKey:@"Email"],
     //[dictData valueForKey:@"PreferContType"],
     [dictData valueForKey:@"NotesforClient"],
     [dictData valueForKey:@"MakeModal"],
     [dictData valueForKey:@"CurrentMile"],
     [dictData valueForKey:@"CurrentMonthallyPayment"],
     [dictData valueForKey:@"DesireMonthallyPayment"],
     [dictData valueForKey:@"NotesForVehicle"],
     [dictData valueForKey:@"PrimaryChoice"],
     [dictData valueForKey:@"SecondaryChoice"],nil];*/
    
    [db close];
    
    return success;
    
    return YES;
}

@end

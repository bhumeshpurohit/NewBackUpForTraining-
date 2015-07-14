//
//  AppDelegate.h
//  ProPad
//
//  Created by Bhumesh on 29/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) NSString *databaseName;
@property (nonatomic,strong) NSString *databasePath;


-(void) createAndCheckDatabase;

-(NSString *)databasePath;

@end


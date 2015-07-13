//
//  ViewController.m
//  JSONusingRequest
//
//  Created by Bhumesh on 26/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchdata];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)fetchdata
{
    NSError *err;
    NSURL *url=[NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:&err];
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  
    NSDictionary *paging=[json objectForKey:@"paging"];
   // NSArray * serverData=[[NSArray alloc]init];
   // serverData=[json valueForKeyPath:@"paging"];
    NSLog(@"Page: %@",[paging objectForKey:@"page"]);
    NSLog(@"page_size: %@",[paging objectForKey:@"page_size"]);
    NSLog(@"pages: %@",[paging objectForKey:@"pages"]);
    NSLog(@"total: %@",[paging objectForKey:@"total"]);
    
    
    NSArray *arr=[json objectForKey:@"loans"];
    //NSLog(@"%@",arr);
    
    for(NSDictionary *d in arr)
    {
        NSLog(@"id:" "%@",[d valueForKey:@"id"]);
        NSLog(@"Name: %@",[d valueForKey:@"name"]);
        NSDictionary *desc=[d objectForKey:@"description"];
        NSLog(@"Language %@",[desc objectForKey:@"languages"]);
        
    }
    
    
    
    
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

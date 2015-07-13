//
//  TabViewController.m
//  
//
//  Created by Bhumesh on 11/06/15.
//
//

#import "TabViewController.h"

@interface TabViewController ()
-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;
-(void)handleDouble:(UITapGestureRecognizer*)tapGestureRecognizer;
@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.testView addGestureRecognizer:singleTapGestureRecognizer];
    
    
    
    
    UITapGestureRecognizer *doubleTapGestureReconizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDouble:)];
   doubleTapGestureReconizer.numberOfTapsRequired=2.0;
    doubleTapGestureReconizer.numberOfTouchesRequired=2.0;
    [self.testView addGestureRecognizer:doubleTapGestureReconizer];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    CGFloat newWidth = 100.0;
    if (self.testView.frame.size.width == 100.0) {
        newWidth = 200.0;
    }
    
    CGPoint currentCenter = self.testView.center;
    
    self.testView.frame = CGRectMake(self.testView.frame.origin.x, self.testView.frame.origin.y, newWidth, self.testView.frame.size.height);
    self.testView.center = currentCenter;
}
-(void)handleDouble:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGFloat newWidth = 100.0;
    CGFloat newHeight= 100.0;
    if (self.testView.frame.size.width == 100.0 && self.testView.frame.size.height==100 ) {
        newWidth = 200.0;
        newHeight =200.0;
        
    }
    
    CGPoint currentCenter = self.testView.center;
    
    self.testView.frame = CGRectMake(self.testView.frame.origin.x, self.testView.frame.origin.y, newWidth, newHeight		);
    self.testView.center = currentCenter;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

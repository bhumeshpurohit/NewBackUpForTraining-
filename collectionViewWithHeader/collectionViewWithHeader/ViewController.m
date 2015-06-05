//
//  ViewController.m
//  collectionViewWithHeader
//
//  Created by Bhumesh on 23/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *Items;
    NSArray *drink,*recipeImages;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[recipeImages objectAtIndex:section] count];
}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPat
//{
//    static NSString *identifier = @"Cell";
//    
//    RecipeViewCell *cell = (RecipeViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    
//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
//    recipeImageView.image = [UIImage imageNamed:[recipeImages[indexPath.section] objectAtIndex:indexPath.row]];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame-2.png"]];
//    
//    return cell;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    Items=[NSArray arrayWithObjects:@"Tea.jpg",@"Sandwich.jpg",@"coffee.jpg",@"noodles.jpg",@"Juice.jpg",nil];
   drink=[NSArray arrayWithObjects:@"Tea.jpg",@"Juice.jpg", nil];
    // Do any additional setup after loading the view, typically from a nib.
     recipeImages = [NSArray arrayWithObjects:Items, drink, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  AKCollectionViewController.m
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/18/15.
//  Copyright (c) 2015 Arafat. All rights reserved.
//


#import "AKCollectionViewController.h"
#import "AKImagesCollectionViewCell.h"
#import "AKClient.h"

@interface AKCollectionViewController ()

@property(nonatomic, strong) NSMutableArray *array;

@end

@implementation AKCollectionViewController

#pragma mark - initials

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Specify image URL's */
    self.array = [[NSMutableArray alloc]init];
    [self.array addObject:@"http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg"];
    [self.array addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG"];
    [self.array addObject:@"http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg"];
    [self.array addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG"];
    [self.array addObject:@"http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg"];
    [self.array addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG"];
    [self.array addObject:@"http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg"];
    [self.array addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG"];
    /* Add more image URL's (if you want) */
    
    
}


#pragma mark - Collection view data source method

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /* Specify Custom ImagesCollectionViewCell here */
    AKImagesCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ImagesCollectionViewCell" forIndexPath:indexPath];
    
    /* Specify Placeholder image */
    cell.imageView.image = [UIImage imageNamed:@"Placeholder"];
    
    AKClient *client = [[AKClient alloc]init];
    
    [client taskForGETMethodWithURL:[self.array objectAtIndex:indexPath.row]
                  completionHandler:^(NSData *data, NSError *error){
                      
                      dispatch_async(dispatch_get_main_queue(), ^(void) {
                          
                          if (data) {
                              cell.imageView.image = [UIImage imageWithData:data];
                              
                          }else{
                              NSLog(@"error:%@",error);
                          }
                      });
                  }];
    
    client = nil;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100,100);
}

#pragma mark - Collection view delegate method

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Index: %li",(long)indexPath.row);
}

@end

//
//  AKTableViewController.m
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/19/15.
//  Copyright (c) 2015 Arafat. All rights reserved.
//

#import "AKTableViewController.h"
#import "AKImagesTableViewCell.h"
#import "AKClient.h"

@interface AKTableViewController ()

@property(nonatomic, strong) NSMutableArray *array;

@end

@implementation AKTableViewController

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


#pragma mark - Table view data source method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* Specify Custom ImagesTableViewCell here */
    static NSString *CellIdentifier = @"ImagesTableViewCell";
    AKImagesTableViewCell *cell = (AKImagesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /* Configure the cell */
    if (cell == nil) {
        cell = [[AKImagesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100.0;
}

#pragma mark - Table view delegate method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    NSLog(@"Selected Index: %li",(long)indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






@end

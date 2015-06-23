//
//  AKImagesCollectionViewCell.h
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/18/15.
//  Copyright (c) 2015 Arafat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKImagesCollectionViewCell : UICollectionViewCell

@property(nonatomic , strong) IBOutlet UIImageView *imageView;
@property(nonatomic , strong) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

//
//  AKImagesTableViewCell.m
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/19/15.
//  Copyright (c) 2015 Arafat. All rights reserved.
//

#import "AKImagesTableViewCell.h"

@implementation AKImagesTableViewCell

@synthesize imageView;

- (void)awakeFromNib {
    
    // Initialization code
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}


@end

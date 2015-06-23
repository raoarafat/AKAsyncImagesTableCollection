//
//  AKClient.h
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/18/15.
//  Copyright (c) 2015 Arafat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKClient : NSObject

-(void)taskForGETMethodWithURL:(NSString*)url
                    completionHandler:(void (^)(NSData *data, NSError *error))completionHandler;

@end

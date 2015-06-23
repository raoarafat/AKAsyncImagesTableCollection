//
//  AKClient.m
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/18/15.
//  Copyright (c) 2015 Arafat. All rights reserved.
//

#import "AKClient.h"

@implementation AKClient

 
//dataTaskWithURL
-(void)taskForGETMethodWithURL:(NSString*)url
                       completionHandler:(void (^)(NSData *data, NSError *error))completionHandler
{
    /* Set the parameters */
    // There are none...
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    /* Make the request */
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        /* Use the data (happens in completion handler) */
        if (error == nil) {
            completionHandler(data, nil);
        }else{
            completionHandler(nil, error);
        }
        
        
        
    }];
    
    /* Start the request */
    [dataTask resume];
}


@end

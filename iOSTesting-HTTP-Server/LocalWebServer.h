//
//  LocalWebServer.h
//
//  Created by Benjamin Whiting on 21/01/2015.
//  Copyright (c) 2015 VocaLink Holdings Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalWebServer : NSObject

+ (instancetype) sharedInstance;
+ (void) startLocalWebServer;

@end

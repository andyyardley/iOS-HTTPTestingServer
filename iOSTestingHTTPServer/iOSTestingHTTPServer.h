//
//  iOSTestingHTTPServer.h
//
//  Created by Benjamin Whiting on 21/01/2015.
//  Copyright (c) 2015 VocaLink Holdings Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iOSTestingHTTPServer : NSObject

+ (instancetype) sharedInstance;
+ (void) startLocalWebServer;
+ (NSURL *) localWebServerURL;

@end

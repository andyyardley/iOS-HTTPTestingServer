//
//  LocalWebServer.h
//
//  Created by Benjamin Whiting on 21/01/2015.
//  Copyright (c) 2015 VocaLink Holdings Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PostArguments) {
    MethodName = 0,
    Argument1,
    Argument2
};

@interface LocalWebServer : NSObject

+ (instancetype) sharedInstance;
+ (void) startLocalWebServer;
+ (NSURL *) localWebServerURL;

@end

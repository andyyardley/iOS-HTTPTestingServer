//
//  LocalWebServer.m
//
//  Created by Benjamin Whiting on 21/01/2015.
//  Copyright (c) 2015 VocaLink Holdings Limited. All rights reserved.
//

#import "LocalWebServer.h"

#import "GCDWebServer.h"
#import "GCDWebServerURLEncodedFormRequest.h"

@interface LocalWebServer()

@property (nonatomic, strong) GCDWebServer *webServer;
@end

@implementation LocalWebServer

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        self.webServer = [GCDWebServer new];
    }
    return self;
}

+ (instancetype) sharedInstance
{
    static LocalWebServer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
    ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

+ (void) startLocalWebServer
{
    [[LocalWebServer sharedInstance] startWebServer];
}
     
- (void) startWebServer
{
    [self addPOSTHandler];
}

- (void) addPOSTHandler
{
    
    __weak typeof(self) weakSelf = self;
    [self.webServer addHandlerForMethod:@"POST"
                                   path:@"/"
                           requestClass:[GCDWebServerURLEncodedFormRequest class]
                           processBlock:^GCDWebServerResponse *(GCDWebServerRequest* request)
     {
         __strong typeof(weakSelf) strongSelf = weakSelf;
         if(strongSelf)
         {
             NSString* postArguments = [[(GCDWebServerURLEncodedFormRequest*)request arguments] objectForKey:@"value"];
             
             [strongSelf processPost:postArguments];
             
             
         }
         return nil;
     }];
}

- (void) processPost:(NSString *) postArguments
{
    NSLog(@"Post %@", postArguments);
}
@end

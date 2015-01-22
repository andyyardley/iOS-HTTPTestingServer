//
//  ViewController.m
//  DemoApp
//
//  Created by Benjamin Whiting on 22/01/2015.
//  Copyright (c) 2015 VocaLink Holdings Limited. All rights reserved.
//

#import "ViewController.h"

//#import "LocalWebServer.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *methodName;
@property (strong, nonatomic) IBOutlet UITextField *argument;
@property (strong, nonatomic) IBOutlet UITextField *argument2;
@property (strong, nonatomic) IBOutlet UITextField *argument3;
@property (strong, nonatomic) IBOutlet UIButton *go;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [LocalWebServer startWebServer];
    self.go.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.methodName)
    {
        if(textField.text.length > 0)
        {
            self.go.enabled = YES;
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (IBAction)go:(UIButton *)sender
{
    NSURL *aUrl = [NSURL URLWithString:@"http://127.0.0.1:8080"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];
    
    [request setHTTPMethod:@"POST"];
    NSString *postString = @"";
    if([self.methodName.text isEqualToString:@""] == NO)
    {
        postString = [postString stringByAppendingString:[NSString stringWithFormat:@"method=%@", self.methodName.text]];
    }
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [connection start];
}


@end

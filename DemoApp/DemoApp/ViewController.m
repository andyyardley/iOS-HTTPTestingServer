//
//  ViewController.m
//  DemoApp
//
//  Created by Benjamin Whiting on 22/01/2015.
//  Copyright (c) 2015 VocaLink Holdings Limited. All rights reserved.
//

#import "ViewController.h"

#import "iOSTestingHTTPServer.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *methodName;
@property (strong, nonatomic) IBOutlet UITextField *argumentName;
@property (strong, nonatomic) IBOutlet UITextField *argumentValue;
@property (strong, nonatomic) IBOutlet UITextField *argument2Name;
@property (strong, nonatomic) IBOutlet UITextField *argument2Value;
@property (strong, nonatomic) IBOutlet UIButton *go;

@property (strong, nonatomic) NSURLConnection *connection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.methodName.delegate = self;
    self.argumentName.delegate = self;
    self.argumentValue.delegate = self;
    self.argument2Name.delegate = self;
    self.argument2Value.delegate = self;

    self.go.enabled = (self.methodName.text.length > 0);
    
    [iOSTestingHTTPServer startLocalWebServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.methodName)
    {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        self.go.enabled = (newLength > 0);
    }
    return YES;
}

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
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)go:(UIButton *)sender
{
    NSURL *webServerURL = [iOSTestingHTTPServer localWebServerURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:webServerURL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    
    [request setHTTPMethod:@"POST"];
    NSString *postString = @"";
    if([self.methodName.text isEqualToString:@""] == NO)
    {
        postString = [postString stringByAppendingString:[NSString stringWithFormat:@"method=%@", self.methodName.text]];
    }
    if(([self.argumentName.text isEqualToString:@""] == NO) && ([self.argumentValue.text isEqualToString:@""] == NO))
    {
        if(postString.length > 0)
        {
            postString = [postString stringByAppendingString:@"&"];
        }
        postString = [postString stringByAppendingString:[NSString stringWithFormat:@"%@=%@", self.argumentName.text, self.argumentValue.text]];
    }
    
    if(([self.argument2Name.text isEqualToString:@""] == NO) && ([self.argument2Value.text isEqualToString:@""] == NO))
    {
        if(postString.length > 0)
        {
            postString = [postString stringByAppendingString:@"&"];
        }
        postString = [postString stringByAppendingString:[NSString stringWithFormat:@"%@=%@", self.argument2Name.text, self.argument2Value.text]];
    }
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSLog(@"responseData: %@", responseData);
}


@end

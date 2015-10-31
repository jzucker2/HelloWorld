//
//  FirstViewController.m
//  HelloWorld
//
//  Created by Jordan Zucker on 10/30/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <PubNub/PubNub.h>
#import "AppDelegate.h"
#import "FirstViewController.h"

@interface FirstViewController () <UITextViewDelegate, PNObjectEventListener>
@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) PubNub *client;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.client = [(AppDelegate *)[UIApplication sharedApplication].delegate client];
    [self.client addListener:self];
    self.textView.delegate = self;
    self.textView.text = @"";
    
}

- (void)dealloc {
    [self.client removeListener:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PNObjectEventListener

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    NSString *messageText = (NSString *)[(NSDictionary *)message.data.message objectForKey:@"text"];
    NSString *stringToAppend = [NSString stringWithFormat:@"%@\n", messageText];
    self.textView.text = [self.textView.text stringByAppendingString:stringToAppend];
}

- (void)client:(PubNub *)client didReceivePresenceEvent:(PNPresenceEventResult *)event {
    
}

- (void)client:(PubNub *)client didReceiveStatus:(PNStatus *)status {
    
}

@end

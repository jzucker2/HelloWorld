//
//  AppDelegate.h
//  HelloWorld
//
//  Created by Jordan Zucker on 10/30/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PubNub;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) PubNub *client;


@end


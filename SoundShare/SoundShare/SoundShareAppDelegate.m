//
//  SoundShareAppDelegate.m
//  SoundShare
//
//  Created by Tobias Kräntzer on 05.08.11.
//  Copyright 2011 nxtbgthng. All rights reserved.
//

#import "SCAPI.h"
#import "SCUI.h"

#import "SoundShareAppDelegate.h"

@implementation SoundShareAppDelegate

@synthesize window;

+ (void)initialize;
{
    // Configure NXOAuth2AccountStore for 'com.soundcloud.api'
    // -------------------------------------------------------
    
    NSAssert(nil, @"Go to http://soundcloud.com/you/apps and register your app.");
    
    [SCSoundCloud  setClientID:@"xXxXxXxXxXxXxXxXxXxXxXxXxXxX"
                        secret:@"xXxXxXxXxXxXxXxXxXxXxXxXxXxX"
                   redirectURL:[NSURL URLWithString:@"soundshare://soundcloud"]];
}


#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor blackColor];
    return YES;
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}

@end

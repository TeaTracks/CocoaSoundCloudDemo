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
    
    [SCSoundCloud  setClientID:@"6770c1811fd2d6ef1c982ee685339681"
                        secret:@"bd4abff2925d068c6a5806613b7842ba"
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

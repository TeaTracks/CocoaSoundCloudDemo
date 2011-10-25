//
//  RootViewController.m
//  SoundShare
//
//  Created by Tobias Kräntzer on 05.08.11.
//  Copyright 2011 nxtbgthng. All rights reserved.
//

#import "SCUI.h"
#import "RootViewController.h"

@implementation RootViewController

#pragma mark - 

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkTexturedBackgroundPattern"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark Actions

- (IBAction)shareToSoundCloud:(id)sender;
{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"1375_sleep_90_bpm_nylon2" ofType:@"wav"];
    NSURL *dataURL = [NSURL fileURLWithPath:dataPath];
    
    SCShareViewController *shareViewController = [SCShareViewController shareViewControllerWithFileURL:dataURL
                                                                                     completionHandler:^(NSDictionary *trackInfo, NSError *error){
                                                                                         
                                                                                         if (SC_CANCELED(error)) {
                                                                                             NSLog(@"Canceled!");
                                                                                         } else if (error) {
                                                                                             NSLog(@"Something went wrong: %@", [error localizedDescription]);
                                                                                         } else {
                                                                                             NSLog(@"Uploaded track: %@", trackInfo);
                                                                                         }
                                                                                         
                                                                                     }];
    
    [shareViewController setTags:[NSArray arrayWithObject:@"foo:bar=baz"]];
    
    [self presentModalViewController:shareViewController animated:YES];
}

- (IBAction)login:(id)sender;
{
    [SCSoundCloud requestAccessWithPreparedAuthorizationURLHandler:^(NSURL *preparedURL){
        
        SCLoginViewController *loginViewController;
        loginViewController = [SCLoginViewController loginViewControllerWithPreparedURL:preparedURL
                                                                      completionHandler:^(NSError *error){
                                                                          
                                                                          if (SC_CANCELED(error)) {
                                                                              NSLog(@"Canceled!");
                                                                          } else if (error) {
                                                                              NSLog(@"Ooops, something went wrong: %@", [error localizedDescription]);
                                                                          } else {
                                                                              NSLog(@"Done!");
                                                                          }
                                                                      }];
        
        [self presentModalViewController:loginViewController
                                animated:YES];
        
    }];
}

@end

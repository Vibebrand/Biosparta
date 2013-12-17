//
//  AppDelegate.m
//  Biosparta
//
//  Created by Jesus Cagide on 01/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
  
    self.mainView = nil;
    self.masterController = nil;
    [_window release];

    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    self.mainView = [[[MainViewController alloc] initWithNibName:@"MainViewController" bundle: [NSBundle mainBundle]] autorelease];
    
    self.masterController = [[BiospartaMasterController new] autorelease];
    [self.masterController setUpProducts];
    [self.mainView setProductListDelegate:self.masterController];
    
    UINavigationController *navigationController = [[UINavigationController new] autorelease] ;
    [navigationController addChildViewController:self.mainView];
    [navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.masterController setNavigationController:navigationController];
    
    [self.window setRootViewController:navigationController ];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

//
//  AppDelegate.h
//  Biosparta
//
//  Created by Jesus Cagide on 01/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

#import "BiospartaMasterController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;
@property (retain, nonatomic) MainViewController *mainView;
@property (retain, nonatomic) BiospartaMasterController * masterController;

@end

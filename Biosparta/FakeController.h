//
//  FakeController.h
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationDelegate.h"

@interface FakeController : UIViewController



@property (nonatomic, assign )IBOutlet UIButton* paymentsButton;
@property (nonatomic, assign )IBOutlet UIButton* backButton;

@property(nonatomic, assign) id<NavigationDelegate> navigationDelegate;




-(IBAction) onClick1: (id) sender;

@end

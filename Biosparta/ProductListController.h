//
//  FakeController.h
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationDelegate.h"
#import "Product.h"

@interface ProductListController : UIViewController



@property (nonatomic, assign )IBOutlet UIButton* paymentsButton;
@property (nonatomic, assign )IBOutlet UIButton* backButton;
@property (nonatomic, retain )IBOutlet UILabel* price;
@property(nonatomic, assign) id<NavigationDelegate> navigationDelegate;
@property(nonatomic, retain) Product* product;


-(IBAction) onClick1: (id) sender;
-(IBAction) onClick2: (id) sender;
@end

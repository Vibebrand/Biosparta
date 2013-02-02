//
//  ProductViewController.h
//  Biosparta
//
//  Created by Jesus Cagide on 01/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UITableViewController


@property (assign, nonatomic) IBOutlet UIView *awesomeZG;
@property (assign, nonatomic) IBOutlet UIScrollView *headerScrollView;
@property (assign, nonatomic) IBOutlet UIPageControl *headerPageControl;
@property (assign, nonatomic) IBOutlet UIView *contontView;

@property (nonatomic) BOOL usedPageControl;

@end

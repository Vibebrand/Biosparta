//
//  FakeController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "FakeController.h"

@interface FakeController ()

@end

@implementation FakeController

@synthesize navigationDelegate;

- (void)dealloc
{
    self.navigationDelegate = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"px_by_Gre3g"]];
    
    UIImage *buttonImage = [[UIImage imageNamed:@"greenButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"greenButton.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    // Set the background for any states you plan to use
    [self.paymentsButton setBackgroundImage:buttonImage forState:UIControlStateNormal]
    ;
    [self.paymentsButton setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) onClick1: (id) sender
{
    [self.navigationDelegate popView];
}

@end

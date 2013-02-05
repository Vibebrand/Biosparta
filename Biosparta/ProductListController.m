//
//  FakeController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "ProductListController.h"

@interface ProductListController ()

@end

@implementation ProductListController

@synthesize navigationDelegate;
@synthesize price;

- (void)dealloc
{
    self.navigationDelegate = nil;
    self.price = nil;
    self.backButton = nil;
    self.paymentsButton = nil;
    
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
    
    [self.price setText: [NSString stringWithFormat:@" Precio $ %f", self.product.price]];
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"px_by_Gre3g"]];
    
    UIImage *buttonImage = [[UIImage imageNamed:@"greenButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"greenButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    // Set the background for any states you plan to use
    [self.paymentsButton setBackgroundImage:buttonImage forState:UIControlStateNormal]
    ;
    [self.paymentsButton setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    
    
    UIImage *buttonImage1 = [[UIImage imageNamed:@"greyButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight1 = [[UIImage imageNamed:@"greyButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    // Set the background for any states you plan to use
    [self.backButton setBackgroundImage:buttonImage1 forState:UIControlStateNormal]
    ;
    [self.backButton setBackgroundImage:buttonImageHighlight1 forState:UIControlStateHighlighted];
    
    
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

-(IBAction) onClick2: (id) sender
{
    [self.navigationDelegate pushCustomView:self.product];
}


@end

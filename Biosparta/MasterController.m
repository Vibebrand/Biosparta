//
//  MasterController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "MasterController.h"
#import "ProductListController.h"
#import "GKLParallaxPicturesViewController.h"
#import "SignupTableViewController.h"


@implementation MasterController


-(void)dealloc
{
    self.navigationController = nil;
    [super dealloc];
}

-(void) showProductListWith:(NSString *) nameProduct;
{
    ProductListController * fakeController = [[ProductListController alloc] initWithNibName:@"ProductListController" bundle:nil];
    [fakeController setNavigationDelegate:self];
    
    GKLParallaxPicturesViewController *paralaxViewController = [[[GKLParallaxPicturesViewController alloc] initWithImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"kinder"], [UIImage imageNamed:@"fresa"],[UIImage imageNamed:@"zanahoria"], nil] andContentView:fakeController.view] autorelease];
  
    [self.navigationController pushViewController:paralaxViewController  animated:YES];
    
}


-(void) popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) pushCustomView
{
    SignupTableViewController* signupVC = [[SignupTableViewController alloc]initWithNibName:@"SignupTableViewController" bundle:nil];
	signupVC.title = NSLocalizedString(@"SignUp", @"");
    [signupVC setNavigationDelegate:self];
    
    [self.navigationController pushViewController:signupVC animated:YES];
}

@end

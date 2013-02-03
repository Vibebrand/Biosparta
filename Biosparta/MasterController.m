//
//  MasterController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "MasterController.h"
#import "FakeController.h"
#import "GKLParallaxPicturesViewController.h"

@implementation MasterController


-(void)dealloc
{
    self.navigationController = nil;
    [super dealloc];
}

-(void) showProductListWith:(NSString *) nameProduct;
{
    //UIView *testContentView = [[[UINib nibWithNibName:@"testContentView" bundle:nil] instantiateWithOwner:nil options:nil] objectAtIndex:0];
    
    FakeController * fakeController = [[FakeController alloc] initWithNibName:@"FakeController" bundle:nil];
    [fakeController setNavigationDelegate:self];
    
    
    GKLParallaxPicturesViewController *paralaxViewController = [[[GKLParallaxPicturesViewController alloc] initWithImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"kindberry"], [UIImage imageNamed:@"fresa-01"],[UIImage imageNamed:@"zanahoria-01"], nil] andContentView:fakeController.view] autorelease];
    
    //paralaxViewController.parallaxHeight = 150;
    
    
    [self.navigationController pushViewController:paralaxViewController  animated:YES];
    
}

-(void) popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

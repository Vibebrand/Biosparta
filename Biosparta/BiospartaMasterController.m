//
//  MasterController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "BiospartaMasterController.h"

#import "ProductListController.h"
#import "GKLParallaxPicturesViewController.h"
#import "SignupTableViewController.h"


@implementation BiospartaMasterController

-(void)setUpProducts
{
    
    self.fiberryProduct = [[Product new] autorelease];
    
    [self.fiberryProduct setTitle:@"Fiberry"];
    [self.fiberryProduct setPrice:199.0];
    [self.fiberryProduct setDescription:@"Descripcion"];
       self.kinderBerry = [[Product new] autorelease];
    [self.kinderBerry setTitle:@"KinderBerry"];
    [self.kinderBerry setPrice:99999.0];
    [self.kinderBerry setDescription:@"Descripcion"];
    [self.fiberryProduct setImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"Fiberry"], [UIImage imageNamed:@"F01"],[UIImage imageNamed:@"F02"], nil]];
    
    [self.kinderBerry setImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"kinder"], [UIImage imageNamed:@"fresa"],[UIImage imageNamed:@"zanahoria"], nil]];
    

}

-(void)dealloc
{
    self.navigationController = nil;
    self.fiberryProduct = nil;
    self.kinderBerry = nil;
    [super dealloc];
}

-(void) showProductListWith:(NSString *) nameProduct;
{
    
    if ([nameProduct isEqualToString:@"Fiberry"]  || [nameProduct isEqualToString:@"KinderBerry"] ) {
        
        Product* product_;
        if([nameProduct isEqualToString:@"Fiberry"] )
        {
            product_ = self.fiberryProduct;
        }else
        {
            product_ = self.kinderBerry;
        }
        ProductListController * fakeController = [[ProductListController alloc] initWithNibName:@"ProductListController" bundle:nil];
        
        [fakeController setNavigationDelegate:self];
        [fakeController setProduct:product_];
        
        GKLParallaxPicturesViewController *paralaxViewController = [[[GKLParallaxPicturesViewController alloc] initWithImages: product_.images andContentView:fakeController.view] autorelease];
        
        [paralaxViewController setProductList:fakeController];
        
        [self.navigationController pushViewController:paralaxViewController  animated:YES];
    }
}

-(void) popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) pushCustomView:(Product*) product;
{
    SignupTableViewController* signupVC = [[SignupTableViewController alloc]initWithNibName:@"SignupTableViewController" bundle:nil];
	signupVC.title = NSLocalizedString(@"SignUp", @"");
    [signupVC setProduct:product];
    [signupVC setNavigationDelegate:self];
    
    [self.navigationController pushViewController:signupVC animated:YES];
}


@end

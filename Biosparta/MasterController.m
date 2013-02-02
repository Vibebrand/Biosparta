//
//  MasterController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "MasterController.h"
#import "ProductViewController.h"
@implementation MasterController


-(void) showProductListWith:(NSString *) nameProduct usingNavigationController:(UINavigationController *) navigationController
{
    ProductViewController * productListView= [[ProductViewController alloc] initWithNibName:@"ProductViewController" bundle: nil];
    [navigationController pushViewController:productListView animated:TRUE];
    [productListView release];
}

@end

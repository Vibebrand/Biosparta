//
//  MasterController.m
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "MasterController.h"
#import "FakeController.h"
@implementation MasterController


-(void) showProductListWith:(NSString *) nameProduct usingNavigationController:(UINavigationController *) navigationController
{
    FakeController* fakeController = [[FakeController alloc] initWithNibName:@"FakeController" bundle:nil];
    [navigationController pushViewController:fakeController  animated:YES];
   [fakeController release];
}

@end

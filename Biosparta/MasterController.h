//
//  MasterController.h
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductListDelegate.h"

@interface MasterController : NSObject<ProductListDelegate>

-(void) showProductListWith:(NSString *) nameProduct usingNavigationController:(UINavigationController *) navigationController;

@end

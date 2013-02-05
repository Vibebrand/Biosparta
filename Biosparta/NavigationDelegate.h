//
//  NavigationDelegate.h
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol NavigationDelegate <NSObject>

-(void) popView;
-(void) pushCustomView:(Product*) product;

@end

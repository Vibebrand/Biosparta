//
//  MasterController.h
//  Biosparta
//
//  Created by Jesus Cagide on 02/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductListDelegate.h"
#import "NavigationDelegate.h"
#import <MediaPlayer/MediaPlayer.h>

@interface BiospartaMasterController : NSObject<ProductListDelegate, NavigationDelegate>

@property(nonatomic, retain)UINavigationController *navigationController;


-(void) showProductListWith:(NSString *) nameProduct;
-(void) popView;


@end

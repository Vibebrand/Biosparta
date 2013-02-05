//
//  Product.h
//  Biosparta
//
//  Created by Jesus Cagide on 03/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(nonatomic,retain)NSString * title;
@property(nonatomic,assign)Float32  price;
@property(nonatomic,retain)NSString * description;
@property(nonatomic,retain)NSArray * images;

@end

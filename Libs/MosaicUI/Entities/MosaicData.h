//
//  MosaicModule.h
//  MosaicUI
//
//  Created by Ezequiel Becerra on 10/21/12.
//  Copyright (c) 2012 betzerra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MosaicData : NSObject{
    NSString *imageFilename;
    NSString *title;
    NSInteger size;
}

-(id)initWithDictionary:(NSDictionary *)aDict;

@property (nonatomic, retain) NSString *imageFilename;
@property (nonatomic, retain) NSString *title;
@property (readwrite) NSInteger size;

@end

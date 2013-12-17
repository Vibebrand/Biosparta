//
//  PadeMobileFramework.h
//  PadeMobileSDK
//
//  Created by Luis Alejandro Rangel Sánchez on 02/02/13.
//  Copyright (c) 2013 Vibebrand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PadeMobileFrameworkDelegate.h"

@interface PadeMobileFramework : NSObject

- (id)initWithDelegate: (id<PadeMobileFrameworkDelegate> ) frameworkDelegate;
- (void) performeBuyOf: (NSNumber *) amount
          withCurrency: (NSString *)currency
              toIdUser:(NSString*)idUser
         withPublicKey:(NSString*)publicKey
         andISOCountry:(NSString*) ISOCountry;

-(void) setSandBox:(BOOL) sandbox;

@property (nonatomic, retain) id<PadeMobileFrameworkDelegate> delegate;

@end

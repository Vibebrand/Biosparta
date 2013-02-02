//
//  MosaicModuleView.h
//  MosaicUI
//
//  Created by Ezequiel Becerra on 10/21/12.
//  Copyright (c) 2012 betzerra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MosaicData.h"
#import "MosaicViewDelegateProtocol.h"
@class MosaicView;

@interface MosaicDataView : UIView <UIGestureRecognizerDelegate>{
    UIImageView *imageView;
    UILabel *titleLabel;
    MosaicData *_module;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) MosaicData *module;
@property (nonatomic, assign) MosaicView *mosaicView;

@end

//
//  MainViewController.h
//  Biosparta
//
//  Created by Jesus Cagide on 01/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MosaicView.h"
#import "MosaicViewDelegateProtocol.h"
#import "ProductListDelegate.h"


@interface MainViewController : UIViewController<MosaicViewDelegateProtocol>{
   
    UIImageView *snapshotBeforeRotation;
    UIImageView *snapshotAfterRotation;
}


 @property(nonatomic,assign) IBOutlet MosaicView *mosaicView;
 @property(nonatomic,assign) id<ProductListDelegate> productListDelegate;

@end

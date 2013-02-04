//
//  MainViewController.m
//  Biosparta
//
//  Created by Jesus Cagide on 01/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import "MainViewController.h"
#import "MosaicData.h"
#import "MosaicDataView.h"
#import "CustomMosaicDatasource.h"
#import "ProductListController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize mosaicView;
@synthesize productListDelegate;

-(void)dealloc
{
    self.mosaicView = nil;
    self.productListDelegate = nil;
    [snapshotBeforeRotation release];
    [snapshotAfterRotation release];
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static UIImageView *captureSnapshotOfView(UIView *targetView){
    UIImageView *retVal = nil;
    
    UIGraphicsBeginImageContextWithOptions(targetView.bounds.size, YES, 0);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [[targetView layer] renderInContext:currentContext];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    retVal = [[UIImageView alloc] initWithImage:image];
    retVal.frame = [targetView frame];
    
    return retVal;
}

#pragma mark - Public

- (void)viewDidLayoutSubviews{
}

- (void)viewDidLoad{
    [super viewDidLoad];
    mosaicView.datasource = [CustomMosaicDatasource sharedInstance];
    mosaicView.delegate = self;

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return NO;
}

#pragma mark - MosaicViewDelegateProtocol

-(void)mosaicViewDidTap:(MosaicDataView *)aModule{
    NSLog(@"#DEBUG Tapped %@", aModule.module);
    [self.productListDelegate showProductListWith:aModule.module.title];
}

-(void)mosaicViewDidDoubleTap:(MosaicDataView *)aModule{
    NSLog(@"#DEBUG Double Tapped %@", aModule.module);
}


@end

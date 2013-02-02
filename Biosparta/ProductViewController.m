//
//  ProductViewController.m
//  Biosparta
//
//  Created by Jesus Cagide on 01/02/13.
//  Copyright (c) 2013 Jesus Cagide. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ProductViewController.h"
#import "UITableView+ZGParallelView.h"

@interface ProductViewController ()

@end

@implementation ProductViewController


@synthesize  awesomeZG;
@synthesize headerScrollView;
@synthesize headerPageControl;
@synthesize contontView;
@synthesize usedPageControl;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeUI];
    [self.tableView addParallelViewWithUIView:self.awesomeZG withDisplayRadio:0.7 cutOffAtMax:YES];
    self.usedPageControl = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self darkerTheBackground:scrollView.contentOffset.x];
}


- (void)customizeUI{
    self.headerScrollView.contentSize = self.contontView.frame.size;
    self.headerScrollView.scrollsToTop = NO;

}

- (void)darkerTheBackground:(CGFloat)xOffSet{
    if (xOffSet != 0) {
        CGFloat pageWidth = self.headerScrollView.frame.size.width;
        CGFloat alphaForContentView = xOffSet/pageWidth;
        if (alphaForContentView > 1.f) {
            alphaForContentView = 1.f;
        } else if (alphaForContentView < 0) {
            alphaForContentView = 0;
        }
        self.headerScrollView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7*alphaForContentView];
        if (!self.usedPageControl) {
            int page = floor((xOffSet - pageWidth / 2) / pageWidth) + 1;
            self.headerPageControl.currentPage = page;
        }
    }
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView == self.headerScrollView) {
        self.usedPageControl = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.headerScrollView) {
        self.usedPageControl = NO;
    }
}

- (IBAction)pageChanged:(UIPageControl *)sender {
    CGFloat headerViewWidth = self.headerScrollView.frame.size.width;
    CGRect frame = self.headerScrollView.frame;
    frame.origin = CGPointMake(headerViewWidth*sender.currentPage, 0);
    self.usedPageControl = YES;
    [self.headerScrollView scrollRectToVisible:frame animated:YES];
}



@end

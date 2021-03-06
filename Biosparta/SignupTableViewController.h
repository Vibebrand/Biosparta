//
//  SignupTableViewController.h
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "NavigationDelegate.h"
#import "PadeMobileFrameworkDelegate.h"
#import "Product.h"

@interface SignupTableViewController : UITableViewController<UITextFieldDelegate, UIActionSheetDelegate, PadeMobileFrameworkDelegate, CLLocationManagerDelegate>
{
	IBOutlet UITableViewCell *cellFirstname;
    IBOutlet UITableViewCell *cellLastname;
    IBOutlet UITableViewCell *cellEmail;
	IBOutlet UITableViewCell *cellPassword;
	IBOutlet UITableViewCell *cellConfirmPassword;
	IBOutlet UITableViewCell *cellGender;
    
	
	IBOutlet UITextField* txtFirstname;
	IBOutlet UITextField* txtLastname;
	IBOutlet UITextField* txtEmail;
	IBOutlet UITextField* txtGender;
	IBOutlet UITextField* txtPassword;
	IBOutlet UITextField* txtConfirmPassword;

	UIActivityIndicatorView* activityIndicator;
    
    GeoRef geoRef;
}

@property (nonatomic, retain) IBOutlet UITableViewCell *cellFirstname;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellLastname;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellEmail;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellPassword;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellConfirmPassword;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellGender;
@property (nonatomic, retain) IBOutlet UITextField* txtFirstname;
@property (nonatomic, retain) IBOutlet UITextField* txtLastname;
@property (nonatomic, retain) IBOutlet UITextField* txtEmail;
@property (nonatomic, retain) IBOutlet UITextField* txtGender;
@property (nonatomic, retain) IBOutlet UITextField* txtPassword;
@property (nonatomic, retain) IBOutlet UITextField* txtConfirmPassword;


@property(nonatomic, retain) IBOutlet UITableViewCell *cellBackButton;
@property(nonatomic, retain) IBOutlet UITableViewCell *cellPaymentButton;
@property(nonatomic, assign) id<NavigationDelegate> navigationDelegate;

@property(nonatomic, retain) Product* product;

-(void)signup;

@end

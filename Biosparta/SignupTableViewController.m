//
//  SignupTableViewController.m
//

#import "SignupTableViewController.h"
#import "PadeMobileFramework.h"

@interface SignupTableViewController ()

@property (nonatomic, retain) PadeMobileFramework * padeMobileFramework;
@property (nonatomic, retain) CLLocationManager * locationManager;


@end

@implementation SignupTableViewController

@synthesize cellFirstname, cellLastname, cellEmail, cellPassword, cellConfirmPassword, cellGender, cellBackButton, cellPaymentButton;

@synthesize txtFirstname, txtLastname, txtEmail, txtGender, txtPassword, txtConfirmPassword;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"px_by_Gre3g"]];
    self.cellPaymentButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeButton"]];
    self.cellBackButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"greyTexture"]];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    [self.locationManager startUpdatingLocation];
    
    geoRef.valid = false;
    geoRef.country = nil;
    
    self.padeMobileFramework = [[[PadeMobileFramework alloc] initWithDelegate: self] autorelease];
    [self.padeMobileFramework setSandBox: YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
        return 50;

    return 15;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 1)
        return 2;

    return 6;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
			return cellFirstname;
		}
		if (indexPath.row == 1) {
			return cellLastname;
		}
		if (indexPath.row == 2) {
			return cellEmail;
		}
		if (indexPath.row == 3) {
			return cellPassword;
		}
		if (indexPath.row == 4) {
			return cellConfirmPassword;
		}
        if (indexPath.row == 5) {
			return cellGender;
		}
    }
    if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
			return cellPaymentButton;
		}
		if (indexPath.row == 1) {
			return cellBackButton;
		}
    }
		return nil;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES ];
    
    if(indexPath.section == 1)
    {
        if (indexPath.row == 0) {
			[self signup];
		}
		if (indexPath.row == 1) {
			[self.navigationDelegate popView];
		}
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{ 
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	
	if (textField == txtGender)
	{
		UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Gender", @"")
																 delegate:self
														cancelButtonTitle:nil
												   destructiveButtonTitle:nil
														otherButtonTitles:NSLocalizedString(@"Male",@""), 
																		  NSLocalizedString(@"Female",@""),
																		  NSLocalizedString(@"NoGender", @""), nil];
		[actionSheet showInView:self.view];
		[actionSheet release];		
	}	
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	NSLog(@"Index is %i", buttonIndex);
	switch(buttonIndex){
		case 0:
			txtGender.text = NSLocalizedString(@"Male",@"");
			break;
		case 1:
			txtGender.text = NSLocalizedString(@"Female",@"");
			break;
		case 2:
			txtGender.text = NSLocalizedString(@"NoGender", @"");
			break;
		default:
			break;
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

-(void) signup
{
	// make sure the keyboard is hidden
	[txtFirstname resignFirstResponder];
	[txtLastname resignFirstResponder];
	[txtEmail resignFirstResponder];
	[txtPassword resignFirstResponder];
	[txtConfirmPassword resignFirstResponder];
		
	activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[activityIndicator setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0+20)]; 
	[activityIndicator startAnimating];
	[self.view addSubview:activityIndicator]; 	
		
	if (![self validateSignupForm])
		return;

	//do your signup code here
	
}

-(BOOL)validateSignupForm
{
	BOOL rtn = YES;
	
    if(rtn) {
        [self.padeMobileFramework performeBuyOf: [NSNumber numberWithFloat: self.product.price ] withCurrency:@"pesos" toIdUser:@"1944" withPublicKey:@"p0aowhdob0ok75e" andISOCountry:@"MX"];
    }
	return rtn;
}

- (UIViewController *) getRootViewController
{
    return self;
}

- (void) requieredOTP
{
    
}

- (BOOL) autoHandleError: (NSString *) error
{
    return YES;
}

- (BOOL) onErrorClose
{
    return YES;
}

- (void) transactionCompleted: (BOOL) correctly
{
    if(correctly)
       [self.navigationDelegate popView];
}

- (GeoRef *) getGeoReference
{
    
    return &geoRef;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * lastLocation = [locations lastObject];
    CLLocationDegrees latitude = lastLocation.coordinate.latitude;
    CLLocationDegrees longitude = lastLocation.coordinate.longitude;
    
    CLGeocoder * geoCoder = [[CLGeocoder new] autorelease];
    [geoCoder reverseGeocodeLocation:lastLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(placemarks && [placemarks count]) {
            if(geoRef.country)
                [geoRef.country release];
            
            CLPlacemark * placeMark = [placemarks objectAtIndex: 0];
            geoRef.country = [placeMark.ISOcountryCode retain];
            geoRef.latitude = latitude;
            geoRef.longitude = longitude;
            geoRef.valid = true;
        }
    }];
}

- (void)dealloc {
    
	[cellFirstname release];
	[cellLastname release];
	[cellEmail release];
	[cellPassword release];
	[cellConfirmPassword release];
	[cellGender release];
	[txtFirstname release];
	[txtLastname release];
	[txtEmail release];
	[txtGender release];
	[txtPassword release];
	[txtConfirmPassword release];
	[activityIndicator release];
    
    self.navigationDelegate = nil;
    self.padeMobileFramework = nil;
    
    self.cellBackButton = nil;
    self.cellPaymentButton = nil;
    self.product =nil;
    
    [geoRef.country release];
    
    [super dealloc];
}


@end


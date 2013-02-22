//
//  MechanicalCounterViewController.m
//  MechanicalCounter
//
//  Created by ignazioc on 02/06/11.
//  Copyright 2011 home. All rights reserved.
//

#import "MechanicalCounterViewController.h"
#import "MechanicalCounter.h"

@implementation MechanicalCounterViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sfondo_devapp.png"]];
	[bg setFrame:[[UIScreen mainScreen] bounds]];
	[self.view addSubview:bg];
	[bg release];
	
	
	/* Creazione del pulsante
	 */
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn setFrame:CGRectMake(160 - 150 / 2, 230 - 60 / 2, 150, 60)];
	[btn setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
	[btn setTitle:@"TAP ME!" forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	
	
	mc = [[MechanicalCounter alloc] initWithFrame:CGRectMake(0, 0, 320, 124) andCiphers:10];
	[mc setCurrentValue:129999989];
	[self.view addSubview:mc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
	[mc showNextValue];
}




@end

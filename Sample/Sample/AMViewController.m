//
//  AMViewController.m
//  Sample
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "AMViewController.h"
#import "UITextField+Shake.h"

@interface AMViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textShakes;
@property (weak, nonatomic) IBOutlet UITextField *textSpeed;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textDelta;

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setTitle:@"Demo"];
	[@[_textDelta, _textField, _textShakes, _textSpeed] enumerateObjectsUsingBlock:^(UITextField* obj, NSUInteger idx, BOOL *stop) {
		[obj.layer setBorderWidth:2];
		[obj.layer setBorderColor:[UIColor colorWithRed:49.0/255.0 green:186.0/255.0 blue:81.0/255.0 alpha:1].CGColor];
		[obj setDelegate:self];
	}];
}

- (IBAction)actionShake:(id)sender
{
	NSLog(@"%d, %f, %f", [self.textShakes.text intValue], [self.textDelta.text floatValue], [self.textSpeed.text floatValue]);
	[self.textField shake:[self.textShakes.text intValue]
		   withDelta:[self.textDelta.text floatValue]
			andSpeed:[self.textSpeed.text floatValue]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if (textField != _textField) {
		[textField resignFirstResponder];
	} else {
		[textField shake:[self.textShakes.text intValue]
			   withDelta:[self.textDelta.text floatValue]
				andSpeed:[self.textSpeed.text floatValue]];
	}
	
	return YES;
}

@end

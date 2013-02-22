//
//  MechanicalCounter.m
//  MechanicalCounter
//
//  Created by ignazioc on 02/06/11.
//  Copyright 2011 home. All rights reserved.
//

#import "MechanicalCounter.h"


@implementation MechanicalCounter
@synthesize ciphers;
@synthesize currentValue;

-(id)initWithFrame:(CGRect)frame andCiphers:(int)nciphers {
	self = [super initWithFrame:frame];
	if (self) {
		self.ciphers = [NSMutableArray arrayWithCapacity:nciphers];
		values = calloc(nciphers, sizeof(int));
		
		/* Calcolo la dimensione in larghezza
		 */
		UIImage *imgtest = [UIImage imageNamed:@"mc_0.png"];
		float width;
		if (imgtest.size.width * nciphers > 320) {
			width = 320 / nciphers;
		}
		else {
			width = frame.size.width / (float)nciphers;
		}
		
		
		/* Calcolo l'array delle immagini per l'animazione
		 */
		NSMutableArray *arr = [NSMutableArray arrayWithCapacity:10];
		for (int i = 10; i <= 19; i++) {
			NSString *str = [NSString stringWithFormat:@"mc_%d.png",i];
			[arr addObject:[UIImage imageNamed:str]];
		}
		
		
		/* Istanzio le singole view
		 */
		for (int i = 0; i < nciphers; i++) {
			UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, frame.size.height)];
			[v setImage:imgtest];
			v.contentMode = UIViewContentModeScaleAspectFit;
			[v setAnimationImages:arr];
			[v setAnimationRepeatCount:1];
			[v setAnimationDuration:0.5];
			[ciphers addObject:v];
			[self addSubview:v];
			[v release];
		}
	}
	return self;
}


-(void)showNextValue {
	[self setValue:++self.currentValue];	
}

- (void)setCipher:(int)acipher value:(int)value {
	if (value != values[acipher]) {
		NSString *str2 = [NSString stringWithFormat:@"mc_%d.png",value];
		[[ciphers objectAtIndex:acipher] setImage:[UIImage imageNamed:str2]];	
		[[ciphers objectAtIndex:acipher] startAnimating];
		values[acipher] = value;
	}
}

- (void)setCurrentValue:(int)acurrentValue {
	currentValue = acurrentValue;
	[self setValue:self.currentValue];
}

- (void)setValue:(int)newValue {
	if (newValue > (pow(10, [ciphers count]) - 1)) {
		if (newValue == (pow(10, [ciphers count]))) {
			newValue = 0;
			currentValue = 0;
		}
		else {
			NSLog(@"Error: value too high");
			return;
		}
	}
	int cifra;
	for (int i = [ciphers count] - 1; i >= 0; i--) {
		cifra = newValue / pow(10, i);
		if (cifra) {
			newValue = newValue - cifra * pow(10, i);
		}
		[self setCipher:[ciphers count] - i - 1 value:cifra];
	}	
}

- (void)dealloc
{
    free(values);
	ciphers = nil;
	
	[super dealloc];
}

@end

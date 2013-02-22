#import <UIKit/UIKit.h>


@interface MechanicalCounter : UIView {
	NSMutableArray *ciphers;
	int *values;
	int currentValue;
}
@property (nonatomic, retain) NSMutableArray *ciphers;
@property (nonatomic, assign) int currentValue;

- (id)initWithFrame:(CGRect)frame andCiphers:(int)nchipers;
- (void)setValue:(int)newValue;
- (void)showNextValue;

@end

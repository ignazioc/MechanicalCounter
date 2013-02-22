//
//  MechanicalCounterAppDelegate.h
//  MechanicalCounter
//
//  Created by ignazioc on 02/06/11.
//  Copyright 2011 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MechanicalCounterViewController;

@interface MechanicalCounterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MechanicalCounterViewController *viewController;

@end

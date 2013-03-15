//
//  AppDelegate.h
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Frameworks
#import <UIKit/UIKit.h>

@class CalendarViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CalendarViewController *viewController;

@end

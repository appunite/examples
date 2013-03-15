//
//  CalendarViewController.h
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Frameworks
#import <AUKit/AUKit.h>

//ViewControllers
#import "DailyTasksViewController.h"

@interface CalendarViewController : AUViewController

//Controllers
@property (nonatomic, strong) DailyTasksViewController* dailyTasksViewController;
@property (nonatomic, strong) UIViewController* segmentedViewController;

@end

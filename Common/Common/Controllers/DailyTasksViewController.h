//
//  DailyTasksViewController.h
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Frameworks
#import <AUKit/AUKit.h>

@interface DailyTasksViewController : AUTableViewController

// currently displayed date
@property (nonatomic, strong) NSDate* date;
@end

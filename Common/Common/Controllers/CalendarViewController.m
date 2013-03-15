//
//  CalendarViewController.m
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Controllers
#import "CalendarViewController.h"
#import "ControlsViewController.h"

//Views
#import "CalendarView.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController {
    __weak CalendarView* _calendarView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadView {
    // get app frame
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // create and assign view
    CalendarView* view = [[CalendarView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;

    // save weak referance
    _calendarView = view;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];

    // add segmented control action
    [_calendarView.segmentedControl addTarget:self
                                       action:@selector(segmentedControlAction:)
                             forControlEvents:UIControlEventValueChanged];

    // create dailyTasksViewController and show its view
    self.dailyTasksViewController = [[DailyTasksViewController alloc] init];
    
    // show first segmented view controller
    [self segmentedControlAction:nil];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldAutorotate {
    return YES;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskAll);
}

#pragma mark - Setters

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDailyTasksViewController:(DailyTasksViewController *)dailyTasksViewController {
    if (_dailyTasksViewController != dailyTasksViewController) {

        // remove old controller
        if (_dailyTasksViewController) {
            [_dailyTasksViewController willMoveToParentViewController:nil];
            [_calendarView setDailyTaskView:nil];
            [_dailyTasksViewController removeFromParentViewController];
            [_dailyTasksViewController didMoveToParentViewController:nil];
        }
        
        // set new controller
        if (dailyTasksViewController) {
            [dailyTasksViewController willMoveToParentViewController:self];
            [self addChildViewController:dailyTasksViewController];
            [_calendarView setDailyTaskView:dailyTasksViewController.view];
            [dailyTasksViewController didMoveToParentViewController:self];
        }
        
        // save referance
        _dailyTasksViewController = dailyTasksViewController;
    }    
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSegmentedViewController:(UIViewController *)segmentedViewController {
    if (_segmentedViewController != segmentedViewController) {
        
        // remove old controller
        if (_segmentedViewController) {
            [_segmentedViewController willMoveToParentViewController:nil];
            [_calendarView setSegmentedContentView:nil];
            [_segmentedViewController removeFromParentViewController];
            [_segmentedViewController didMoveToParentViewController:nil];
        }
        
        // set new controller
        if (segmentedViewController) {
            [segmentedViewController willMoveToParentViewController:self];
            [self addChildViewController:segmentedViewController];
            [_calendarView setSegmentedContentView:segmentedViewController.view];
            [segmentedViewController didMoveToParentViewController:self];
        }
        
        // save referance
        _segmentedViewController = segmentedViewController;
    }
}


#pragma mark - Actions

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)segmentedControlAction:(UISegmentedControl *)sender {
    NSInteger index = sender ? sender.selectedSegmentIndex : 0;

    if (index == 0) {
        ControlsViewController* viewController = [[ControlsViewController alloc] init];
        [self setSegmentedViewController:viewController];
        
        viewController.view.backgroundColor = [UIColor whiteColor];
    }
    
    else {
        UIViewController* viewController = [[UIViewController alloc] init];
        [self setSegmentedViewController:viewController];
        
        viewController.view.backgroundColor = [UIColor blueColor];
    }
    
    if (_calendarView.segmentedControl.selectedSegmentIndex < 0) {
        _calendarView.segmentedControl.selectedSegmentIndex = index;
    }

    if (!sender) {
        [_calendarView.segmentedControl setSelectedSegmentIndex:index];
    }
}

@end

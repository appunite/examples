//
//  ControlsViewController.m
//  Example
//
//  Created by Emil Wojtaszek on 12.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "ControlsViewController.h"

//Views
#import "ControlsView.h"

@interface ControlsViewController ()

@end

@implementation ControlsViewController {
    __weak ControlsView* _controlsView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadView {
    // get app frame
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // create and assign view
    ControlsView* view = [[ControlsView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    // save weak referance
    _controlsView = view;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];

    // random priority
    [_controlsView.priorityView setPriorityMode:arc4random()%3];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ControlsView.h
//  Example
//
//  Created by Emil Wojtaszek on 12.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Frameworks
#import <AUKit/AUKit.h>

//Views
#import "EPPriorityView.h"

@interface ControlsView : UIView

@property (nonatomic, strong, readonly) EPPriorityView* priorityView;
@end

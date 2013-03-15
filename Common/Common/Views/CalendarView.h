//
//  CalendarView.h
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

// Frameworks
#import <AUKit/AUKit.h>

@interface CalendarView : UIView

// Views pf child controllers
@property (nonatomic, strong) UIView* dailyTaskView;
@property (nonatomic, strong) UIView* segmentedContentView;

@property (nonatomic, strong, readonly) UISegmentedControl* segmentedControl;

// setters
- (void)setCurrentDate:(NSDate *)date;
- (void)setQuoteText:(NSString *)text;
@end

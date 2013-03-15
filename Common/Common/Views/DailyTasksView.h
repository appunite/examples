//
//  DailyTasksView.h
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Frameworks
#import <AUKit/AUKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DailyTasksView : UIView {
    UILabel* _dateLabel;
}

//Buttons
@property (nonatomic, strong, readonly) UIButton* previousDayButton;
@property (nonatomic, strong, readonly) UIButton* subsequentDayButton;

//Others
@property (nonatomic, strong, readonly) UITableView* tableView;

//Setters
- (void)setDate:(NSDate *)date;
@end

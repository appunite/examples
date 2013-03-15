//
//  DailyTaksCell.h
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Frameworks
#import <AUKit/AUKit.h>

@interface DailyTaksCell : UITableViewCell {
    // ImageViews
    UIImageView* _statusImageView;

    //Labels
    UILabel* _taskDateLabel;
    UILabel* _taskTextLabel;
    UILabel* _participantsLabel;
}

// setters
- (void)setTaskText:(NSString *)text;
- (void)setParticipantsText:(NSString *)text;
- (void)setTaskDateText:(NSString *)string;
@end

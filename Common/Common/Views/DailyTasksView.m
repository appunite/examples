//
//  DailyTasksView.m
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "DailyTasksView.h"

//Buttons
#import "EPButton.h"

//Others
#import <AUKit/UILabel+Additions.h>

@implementation DailyTasksView {
    UIImageView* _topBarImageView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // load resources
        UIImage* topBackground = [[UIImage imageNamed:@"task_top_bar_bg"] resizableImageWithCapInsets:UIEdgeInsetsZero];
        
        // add main table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_tableView];

        // add top bar image view (under buttons)
        _topBarImageView = [[UIImageView alloc] init];
        _topBarImageView.image = topBackground;
        [self addSubview:_topBarImageView];
        
        // add button with left arrow
        _previousDayButton = [EPButton grayButtonWithLeftArrow];
        [self addSubview:_previousDayButton];

        // add button with right arrow
        _subsequentDayButton = [EPButton grayButtonWithRightArrow];
        [self addSubview:_subsequentDayButton];

        // add middle date label
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.backgroundColor = [UIColor clearColor];
        _dateLabel.textColor = HTML(0x353839);
        _dateLabel.shadowColor = [[UIColor whiteColor] colorWithAlphaComponent:.75f];
        _dateLabel.shadowOffset = CGSizeMake(0.f, 1.f);
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        _dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.f];
        _dateLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_dateLabel];
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 2.0f, 10.0f);
    
    CGSize barSize = CGSizeMake(CGRectGetWidth(rect), 37.f);
    CGRect barRect = CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), barSize.width, barSize.height);
    _topBarImageView.frame = barRect;
    
    CGSize buttonSize = CGSizeMake(32.0f, 32.0f);
    CGRect leftButtonRect = CGRectMake(CGRectGetMinX(rectInset), CGRectGetMinY(rect) + 3.f, buttonSize.width, buttonSize.height);
    CGRect rightButtonRect = CGRectMake(CGRectGetMaxX(rectInset) - buttonSize.width, CGRectGetMinY(rect) + 3.f, buttonSize.width, buttonSize.height);
    _previousDayButton.frame = leftButtonRect;
    _subsequentDayButton.frame = rightButtonRect;
    
    CGFloat dateWidth = CGRectGetMinX(rightButtonRect) - CGRectGetMaxX(leftButtonRect) - 20.f;
    CGSize dateSize = [_dateLabel textSizeForWith:dateWidth];
    CGRect dateRect = CGRectIntegral(CGRectMake(CGRectGetMidX(rectInset) - dateSize.width * 0.5f, CGRectGetMidY(leftButtonRect) - dateSize.height * .5f, dateSize.width, dateSize.height));
    _dateLabel.frame = dateRect;
    
    CGSize tableSize = CGSizeMake(CGRectGetWidth(rect), CGRectGetHeight(rect) - CGRectGetMaxY(barRect) + 2.f);
    CGRect tableRect = CGRectMake(CGRectGetMinX(rect), CGRectGetMaxY(barRect) - 2.f, tableSize.width, tableSize.height);
    _tableView.frame = tableRect;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDate:(NSDate *)date {
    static NSDateFormatter* _formatter;
    
    // create date formatter if needed
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"EEEE, MMMM dd"];
    }

    // update date label text
    _dateLabel.text = [_formatter stringFromDate:date];
    [self setNeedsLayout];
}

@end

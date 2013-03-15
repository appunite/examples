//
//  CalendarView.m
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "CalendarView.h"

//Others
#import <AUKit/UILabel+Additions.h>
#import <AUKit/NSDateFormatter+Additions.h>

@implementation CalendarView {
    //Labels
    UILabel* _currentDateLabel;
    UILabel* _quoteLabel;
    UILabel* _dailyTasksTitleLabel;
    
    //ImageViews
    UIImageView* _quoteImageView;
    UIImageView* _dailyTasksBackgroundImageView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // set background color
        self.backgroundColor = [UIColor colorWithPatternImageName:@"calendar_pattern"];
        
        // load resources
        UIImage* qouteImage = [UIImage imageNamed:@"quote_img"];
        UIImage* tasksBackground = [[UIImage imageNamed:@"dailt_tasks_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(41.f, 11.f, 11.0f, 11.f)];

        // add currnet date label (top right corner)
        _currentDateLabel = [[UILabel alloc] init];
        _currentDateLabel.backgroundColor = [UIColor clearColor];
        _currentDateLabel.textColor = HTML(0x535353);
        _currentDateLabel.textAlignment = NSTextAlignmentCenter;
        _currentDateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0f];
        _currentDateLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _currentDateLabel.numberOfLines = 0;
        [self addSubview:_currentDateLabel];
        
        // add quote image view
        _quoteImageView = [[UIImageView alloc] init];
        _quoteImageView.image = qouteImage;
        [self addSubview:_quoteImageView];

        // add currnet date label (top right corner)
        _quoteLabel = [[UILabel alloc] init];
        _quoteLabel.backgroundColor = [UIColor clearColor];
        _quoteLabel.textColor = HTML(0x535353);
        _quoteLabel.textAlignment = NSTextAlignmentLeft;
        _quoteLabel.font = [UIFont fontWithName:@"Georgia-Italic" size:21.0f];
        _quoteLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _quoteLabel.numberOfLines = 0;
        [self addSubview:_quoteLabel];

        // add nice background
        _dailyTasksBackgroundImageView = [[UIImageView alloc] init];
        _dailyTasksBackgroundImageView.image = tasksBackground;
        [self addSubview:_dailyTasksBackgroundImageView];

        // add dailt todo header title
        _dailyTasksTitleLabel = [[UILabel alloc] init];
        _dailyTasksTitleLabel.text = NSLocalizedString(@"Daily ToDo", nil);
        _dailyTasksTitleLabel.backgroundColor = [UIColor clearColor];
        _dailyTasksTitleLabel.textColor = HTML(0x535353);
        _dailyTasksTitleLabel.textAlignment = NSTextAlignmentCenter;
        _dailyTasksTitleLabel.font = [UIFont fontWithName:@"Georgia" size:16.0f];
        _dailyTasksTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _dailyTasksTitleLabel.numberOfLines = 0;
        [self addSubview:_dailyTasksTitleLabel];

        // add right side segmented control
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[ @"Segment 1", @"Segment 2" ]];
        _segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
        [self addSubview:_segmentedControl];
        
        // to delete
        [self setCurrentDate:nil];
        [self setQuoteText:nil];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 25.0f, 20.0f);

    CGFloat panelSpace = 30.f;
    CGSize panelSize = CGSizeMake((CGRectGetWidth(rectInset) - panelSpace) * .5f, CGRectGetHeight(rectInset));
    CGRect leftPanelRect = CGRectMake(CGRectGetMinX(rectInset), CGRectGetMinY(rectInset), panelSize.width, panelSize.height);
    CGRect rightPanelRect = CGRectMake(CGRectGetMaxX(leftPanelRect) + panelSpace, CGRectGetMinY(rectInset), panelSize.width, panelSize.height);
    
    CGSize dateSize = CGSizeMake(CGRectGetWidth(leftPanelRect), 100.0f);
    CGRect dateRect = CGRectMake(CGRectGetMinX(leftPanelRect), CGRectGetMinY(leftPanelRect) + 30.f, dateSize.width, dateSize.height);
    _currentDateLabel.frame = dateRect;
    
    CGSize quoteImageSize = CGSizeMake(22.f, 16.f);
    CGRect quoteImageRect = CGRectMake(CGRectGetMinX(leftPanelRect) + 25.f, CGRectGetMaxY(dateRect) + 15.f, quoteImageSize.width, quoteImageSize.height);
    _quoteImageView.frame = quoteImageRect;
    
    CGSize quoteSize = [_quoteLabel textSizeConstrainedToSize:CGSizeMake(CGRectGetWidth(leftPanelRect) - 20.0f, CGFLOAT_MAX)];
    CGRect quoteRect = CGRectMake(CGRectGetMinX(leftPanelRect) + 14.f, CGRectGetMinY(quoteImageRect) - 3.f, quoteSize.width, quoteSize.height);
    _quoteLabel.frame = quoteRect;
    
    CGSize dailtTaskBackgroundSize = CGSizeMake(CGRectGetWidth(leftPanelRect), CGRectGetMaxY(leftPanelRect) - CGRectGetMaxY(quoteRect) - 50.f);
    CGRect dailtTaskBackgroundRect = CGRectMake(CGRectGetMinX(leftPanelRect), CGRectGetMaxY(quoteRect) + 50.f, dailtTaskBackgroundSize.width, dailtTaskBackgroundSize.height);
    _dailyTasksBackgroundImageView.frame = dailtTaskBackgroundRect;

    CGSize dailyTasksTitleSize = [_dailyTasksTitleLabel textSize];
    CGRect dailyTasksTitleRect = CGRectMake(CGRectGetMidX(dailtTaskBackgroundRect) - dailyTasksTitleSize.width * .5f, CGRectGetMinY(dailtTaskBackgroundRect) + 10.f, dailyTasksTitleSize.width, dailyTasksTitleSize.height);
    _dailyTasksTitleLabel.frame = dailyTasksTitleRect;

    CGSize dailtTaskSize = CGSizeMake(dailtTaskBackgroundSize.width - 2.f, dailtTaskBackgroundSize.height - 43.f);
    CGRect dailtTaskRect = CGRectMake(CGRectGetMinX(dailtTaskBackgroundRect) + 1.f, CGRectGetMinY(dailtTaskBackgroundRect) + 40.f, dailtTaskSize.width, dailtTaskSize.height);
    _dailyTaskView.frame = dailtTaskRect;
    
    CGSize segmentSize = CGSizeMake(153.f, 30.f);
    CGRect segmentRect = CGRectMake(CGRectGetMidX(rightPanelRect) - segmentSize.width * .5f, CGRectGetMinY(rightPanelRect) + 20.f, segmentSize.width, segmentSize.height);
    _segmentedControl.frame = segmentRect;
    
    CGSize segmentedContentSize = CGSizeMake(CGRectGetWidth(rightPanelRect), CGRectGetMaxY(rightPanelRect) - CGRectGetMaxY(segmentRect) - 11.f);
    CGRect segmentedContentRect = CGRectMake(CGRectGetMinX(rightPanelRect), CGRectGetMaxY(segmentRect) + 10.f, segmentedContentSize.width, segmentedContentSize.height);
    _segmentedContentView.frame = segmentedContentRect;
}

#pragma mark - Setters

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCurrentDate:(NSDate *)date {
    _currentDateLabel.text = @"16 Sunday April, 2012";
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setQuoteText:(NSString *)text {
    _quoteLabel.text = @"       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis dolor nisl. Fusce velit risus, tristique dignissim congue vitae";
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDailyTaskView:(UIView *)dailyTaskView {
    if (_dailyTaskView != dailyTaskView) {

        // remove old view
        if (_dailyTaskView) {
            [_dailyTaskView removeFromSuperview];
        }

        // save referance
        _dailyTaskView = dailyTaskView;
        
        // add new view
        [self addSubview:_dailyTaskView];
        [self setNeedsLayout];
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSegmentedContentView:(UIView *)segmentedContentView {
    if (_segmentedContentView != segmentedContentView) {
        
        // remove old view
        if (_segmentedContentView) {
            [_segmentedContentView removeFromSuperview];
        }
        
        // save referance
        _segmentedContentView = segmentedContentView;
        
        // add new view
        [self addSubview:_segmentedContentView];
        [self setNeedsLayout];
    }
}

@end

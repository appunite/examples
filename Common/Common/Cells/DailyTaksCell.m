//
//  DailyTaksCell.m
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//DataLoaders
#import "DailyTaksCell.h"

//Others
#import <AUKit/UILabel+Additions.h>

@implementation DailyTaksCell {
    //ImageViews
    UIImageView* _participantsImageView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        // load resources
        UIImage* statucImage = [UIImage imageNamed:@"task_group_dot_orange"];
        UIImage* participantsImage = [UIImage imageNamed:@"participants_small"];
        
        // selected background view
        UIView* selected = [[UIView alloc] init];
        selected.backgroundColor = [UIColor colorWithHex:0x0083df alpha:.05f];
        self.selectedBackgroundView = selected;
        
        // left side colored dot
        _statusImageView = [[UIImageView alloc] init];
        _statusImageView.image = statucImage;
        [self.contentView addSubview:_statusImageView];
        
        // add time period task label
        _taskDateLabel = [[UILabel alloc] init];
        _taskDateLabel.backgroundColor = [UIColor clearColor];
        _taskDateLabel.textColor = HTML(0x3f4040);
        _taskDateLabel.textAlignment = NSTextAlignmentLeft;
        _taskDateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0f];
        _taskDateLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_taskDateLabel];

        // add task text label
        _taskTextLabel = [[UILabel alloc] init];
        _taskTextLabel.backgroundColor = [UIColor clearColor];
        _taskTextLabel.textColor = HTML(0x3f4040);
        _taskTextLabel.textAlignment = NSTextAlignmentLeft;
        _taskTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.f];
        _taskTextLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_taskTextLabel];

        // add small participants on left side of _participantsLabel
        _participantsImageView = [[UIImageView alloc] init];
        _participantsImageView.image = participantsImage;
        [self.contentView addSubview:_participantsImageView];

        // add task text label
        _participantsLabel = [[UILabel alloc] init];
        _participantsLabel.backgroundColor = [UIColor clearColor];
        _participantsLabel.textColor = HTML(0x989898);
        _participantsLabel.textAlignment = NSTextAlignmentLeft;
        _participantsLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.f];
        _participantsLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_participantsLabel];
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 12.f, 8.f);
    
    // layout left top status dot image view
    CGSize dotSize = CGSizeMake(9.f, 9.f);
    CGRect dotRect = CGRectMake(CGRectGetMinX(rectInset), CGRectGetMinY(rectInset) + 5.f, dotSize.width, dotSize.height);
    _statusImageView.frame = dotRect;
    
    // layout top task period bold label
    CGSize dateSize = [_taskDateLabel textSize];
    CGRect dateRect = CGRectIntegral(CGRectMake(CGRectGetMaxX(dotRect) + 5.f, CGRectGetMidY(dotRect) - dateSize.height * .5f, dateSize.width, dateSize.height));
    _taskDateLabel.frame = dateRect;

    // layout taks text, top line
    CGFloat taskWidth = CGRectGetMaxX(rectInset) - CGRectGetMaxX(dateRect) - 10.f;
    CGSize taskSize = [_taskTextLabel textSizeForWith:taskWidth];
    CGRect taskRect = CGRectIntegral(CGRectMake(CGRectGetMaxX(dateRect) + 5.f, CGRectGetMidY(dateRect) - taskSize.height * .5f, taskSize.width, taskSize.height));
    _taskTextLabel.frame = taskRect;
    
    // bottom line participants image
    CGSize participantsImageSize = CGSizeMake(14.f, 8.f);
    CGRect participantsImageRect = CGRectMake(CGRectGetMinX(dateRect), CGRectGetMaxY(dateRect) + 4.f, participantsImageSize.width, participantsImageSize.height);
    _participantsImageView.frame = participantsImageRect;
    
    CGSize participantsSize = [_participantsLabel textSizeForWith:CGRectGetWidth(rectInset)];
    CGRect participantsRect = CGRectMake(CGRectGetMaxX(participantsImageRect) + 3.f, CGRectGetMaxY(participantsImageRect) - participantsSize.height + 3.0f, participantsSize.width, participantsSize.height);
    _participantsLabel.frame = participantsRect;
    
}

#pragma mark - Setters

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTaskText:(NSString *)text {
    _taskTextLabel.text = text;
    [self setNeedsLayout];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setParticipantsText:(NSString *)text {
    _participantsLabel.text = text;
    [self setNeedsLayout];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTaskDateText:(NSString *)string {
    // change text poperty
    _taskDateLabel.text = string;
    [self setNeedsLayout];
}

@end

//
//  ControlsView.m
//  Example
//
//  Created by Emil Wojtaszek on 12.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "ControlsView.h"

@implementation ControlsView

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        // add priority view
        _priorityView = [[EPPriorityView alloc] init];
        [self addSubview:_priorityView];
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 10.f, 10.f);

    // layout priority view
    CGSize prioritySize = [_priorityView contentSize];
    CGRect priorityRect = CGRectMake(CGRectGetMidX(rectInset) - prioritySize.width * .5f, CGRectGetMidY(rectInset) - prioritySize.height * .5f, prioritySize.width, prioritySize.height);
    _priorityView.frame = priorityRect;
}

@end

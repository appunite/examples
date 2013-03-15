//
//  EPPriorityView.h
//  Example
//
//  Created by Emil Wojtaszek on 12.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "EPPriorityView.h"

// types of content mode
typedef NS_ENUM(NSUInteger, EPPriorityMode) {
    EPPriorityLow       = 0,
    EPPriorityNormal    = 1,
    EPPriorityHigh      = 2,
};

@interface EPPriorityView : UIView {
    // status name label (right side)
    UILabel* _label;

    // status image view (left side)
    UIImageView* _imageView;
}

// keep current priority mode
@property (nonatomic, assign) EPPriorityMode priorityMode;

// return actual content size which fit bounds
- (CGSize)contentSize;
@end

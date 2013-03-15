//
//  EPPriorityView.m
//  Example
//
//  Created by Emil Wojtaszek on 12.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "EPPriorityView.h"

//Others
#import <AUKit/UILabel+Additions.h>

@implementation EPPriorityView

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        // add bars image view
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        // add text label
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.lineBreakMode = NSLineBreakByClipping;
        _label.shadowColor = [UIColor whiteColor];
        _label.shadowOffset = CGSizeMake(0.f, 1.f);
        _label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.f];
        [self addSubview:_label];
        
        // set default priority
        [self setPriorityMode:EPPriorityNormal];
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 1.f, 1.f);

    // layout image view - keep left side
    CGSize imageSize = CGSizeMake(23.f, 16.f);
    CGRect imageRect = CGRectMake(CGRectGetMinX(rectInset), CGRectGetMidY(rectInset) - imageSize.height * .5f, imageSize.width, imageSize.height);
    _imageView.frame = imageRect;

    // layout text label
    CGFloat width = CGRectGetMaxX(rectInset) - CGRectGetMaxX(imageRect) + 4.f;
    CGSize textSize = [_label textSizeForWith:width];
    CGRect textRect = CGRectIntegral(CGRectMake(CGRectGetMaxX(imageRect) + 4.f, CGRectGetMidY(rectInset) - textSize.height * .5f, textSize.width, textSize.height));
    _label.frame = textRect;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)contentSize {
    // get views size
    CGSize imageSize = CGSizeMake(23.f, 16.f);
    CGSize textSize = [_label textSize];

    // calculate max size
    CGSize size = CGSizeMake(imageSize.width + textSize.width + 4.f, fmaxf(imageSize.height, textSize.height));
    
    // return extended rect (1.f padding)
    return CGSizeMake(size.width + 2.f, size.height + 2.f);
}


#pragma mark - Setters

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setPriorityMode:(EPPriorityMode)priorityMode {
    if (_priorityMode != priorityMode) {
        _priorityMode = priorityMode;

        switch (priorityMode) {
            case EPPriorityHigh:
            {
                // assing new image
                _imageView.image = [UIImage imageNamed:@"prioroty_high"];
                
                // setup label
                _label.text = NSLocalizedString(@"High", nil);
                _label.textColor = HTML(0xcf0000);
                break;
            }

            case EPPriorityNormal:
            {
                // assing new image
                _imageView.image = [UIImage imageNamed:@"prioroty_normal"];
                
                // setup label
                _label.text = NSLocalizedString(@"Normal", nil);
                _label.textColor = HTML(0xdfb906);
                break;
            }
            
            case EPPriorityLow:
            {
                // assing new image
                _imageView.image = [UIImage imageNamed:@"prioroty_low"];
                
                // setup label
                _label.text = NSLocalizedString(@"Low", nil);
                _label.textColor = HTML(0x7db0d1);
                break;
            }
            default:
                break;
        }
        
        // layout subviews
        [self setNeedsLayout];
    }
}

@end

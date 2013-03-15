//
//  EPButton.m
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

#import "EPButton.h"

@implementation EPButton

////////////////////////////////////////////////////////////////////////////////////////////////////
+ (EPButton *)grayButtonWithImage:(UIImage *)image {
    // get resources
    UIImage* bgImage = [[UIImage imageNamed:@"gray_btn"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 7.0f, 0.0f, 7.0f)];

    // create custom button
    EPButton* button = [[EPButton alloc] init];
    
    // set images
    [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    // setup title font, color
    [button setTitleColor:HTML(0xe0dcd4) forState:UIControlStateNormal];
    [button setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.75f] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f]];
    [button.titleLabel setShadowOffset:CGSizeMake(0.0f, 1.0f)];
    
    return button;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
+ (EPButton *)grayButtonWithLeftArrow {
    // load resource
    UIImage* arrowImage = [UIImage imageNamed:@"arrow_left_horizontal"];
    
    // retunr new button
    return [self grayButtonWithImage:arrowImage];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
+ (EPButton *)grayButtonWithRightArrow {
    // load resource
    UIImage* arrowImage = [UIImage imageNamed:@"arrow_right_horizontal"];
    
    // retunr new button
    return [self grayButtonWithImage:arrowImage];
}

@end

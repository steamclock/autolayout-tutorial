//
//  UIView+SCConstraintsHelper.m
//  AutolayoutExample
//
//  Created by Allen Pike on 2012-09-28.
//  Copyright (c) 2012 Allen Pike. All rights reserved.
//

#import "UIView+SCConstraintsHelper.h"

@implementation UIView (SCConstraintsHelper)

- (void)addVisualConstraints:(NSString*)constraintString forViews:(NSDictionary*)views {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintString
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];
}

- (void)addEqualityConstraintOn:(NSLayoutAttribute)attribute forSubview:(UIView*)subview {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                    attribute:attribute
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:attribute
                                                   multiplier:1.0
                                                     constant:0.0]];
}



@end

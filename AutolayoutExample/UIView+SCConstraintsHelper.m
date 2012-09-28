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


@end

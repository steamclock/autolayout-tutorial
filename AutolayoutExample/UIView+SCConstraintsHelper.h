//
//  UIView+SCConstraintsHelper.h
//  AutolayoutExample
//
//  Created by Allen Pike on 2012-09-28.
//  Copyright (c) 2012 Allen Pike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SCConstraintsHelper)

- (void)addVisualConstraints:(NSString*)constraintString forViews:(NSDictionary*)views;

@end

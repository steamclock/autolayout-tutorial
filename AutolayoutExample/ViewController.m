//
//  ViewController.m
//  AutolayoutExample
//
//  Created by Allen Pike on 2012-09-28.
//  Copyright (c) 2012 Allen Pike. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SCConstraintsHelper.h"

@interface ViewController ()

@end

@implementation ViewController

// po [[UIWindow keyWindow] _autolayoutTrace]

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIView* tabBar = [UIView new]; // new is shorthand for alloc then init
    tabBar.translatesAutoresizingMaskIntoConstraints = NO;
    tabBar.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];

    [self.view addSubview:tabBar];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(tabBar);
    
    [self.view addVisualConstraints:@"|[tabBar]|" forViews:views];
    [self.view addVisualConstraints:@"V:[tabBar(49)]|" forViews:views];
    
    NSArray* tabNames = @[@"Favorites", @"Recents", @"Contacts", @"Keypad", @"Voicemail"];
    NSMutableArray* tabs = [NSMutableArray array];

    // Create the tabs
    [tabNames enumerateObjectsUsingBlock:^(NSString* tabName, NSUInteger idx, BOOL *stop) {
        UIView* tab = [UIView new];
        tab.translatesAutoresizingMaskIntoConstraints = NO;
        
        tab.backgroundColor = [UIColor colorWithWhite:(0.6) alpha:1.0];
        [tabBar addSubview:tab];

        [tabs addObject:tab];
    }];

    // Add the constraints

    for (int i = 0; i < tabs.count; i++) {
        UIView* tab = [tabs objectAtIndex:i];
        UIView* prevTab = tab;
        
        if (i > 0) {
            prevTab = [tabs objectAtIndex:(i - 1)];
        }

        NSDictionary* views = NSDictionaryOfVariableBindings(tab, prevTab);

        if (i == 0) {
            // leftmost tab
            [tabBar addVisualConstraints:@"|[tab]" forViews:views];
        } else if (i == tabs.count - 1) {
            // rightmost tab
            [tabBar addVisualConstraints:@"[prevTab]-[tab(==prevTab)]|" forViews:views];
        } else {
            [tabBar addVisualConstraints:@"[prevTab]-[tab(==prevTab)]" forViews:views];
        }
        
        [tabBar addVisualConstraints:@"V:|[tab]|" forViews:views];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

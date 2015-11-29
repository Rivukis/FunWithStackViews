//
//  ShowAllDistributionOptionsViewController.m
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/25/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import "ShowPropertyOptionsViewController.h"
#import "PropertyViewController.h"

@interface ShowPropertyOptionsViewController ()

@property (nonatomic, weak) IBOutlet UIView *fillView;
@property (nonatomic, weak) IBOutlet UIView *fillEquallyView;
@property (nonatomic, weak) IBOutlet UIView *fillProportionallyView;
@property (nonatomic, weak) IBOutlet UIView *equalSpacingView;
@property (nonatomic, weak) IBOutlet UIView *equalCenteringView;

@end

@implementation ShowPropertyOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PropertyViewController *fillVC = [[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFill];
    PropertyViewController *fillEquallyVC = [[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFillEqually];
    PropertyViewController *fillProportionallyVC = [[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFillProportionally];
    PropertyViewController *equalSpacingVC = [[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionEqualSpacing];
    PropertyViewController *equalCenteringVC = [[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionEqualCentering];
    
    [self addChildViewController:fillVC toParentView:self.fillView];
    [self addChildViewController:fillEquallyVC toParentView:self.fillEquallyView];
    [self addChildViewController:fillProportionallyVC toParentView:self.fillProportionallyView];
    [self addChildViewController:equalSpacingVC toParentView:self.equalSpacingView];
    [self addChildViewController:equalCenteringVC toParentView:self.equalCenteringView];
}

- (void)addChildViewController:(UIViewController *)childController toParentView:(UIView *)parentView {
    UIView *subview = childController.view;
    UILayoutGuide *margins = parentView.layoutMarginsGuide;
    
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    parentView.layoutMargins = UIEdgeInsetsZero;
    
    [self addChildViewController:childController];
    [childController didMoveToParentViewController:self];
    
    [parentView addSubview:subview];
    [childController.view.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [childController.view.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;
    [childController.view.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [childController.view.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
}

@end

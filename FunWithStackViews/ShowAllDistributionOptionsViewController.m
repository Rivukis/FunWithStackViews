//
//  ShowAllDistributionOptionsViewController.m
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/25/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import "ShowAllDistributionOptionsViewController.h"
#import "DistributionPropertyViewController.h"

@interface ShowAllDistributionOptionsViewController ()

@property (nonatomic, weak) IBOutlet UIView *fillView;
@property (nonatomic, weak) IBOutlet UIView *fillEquallyView;
@property (nonatomic, weak) IBOutlet UIView *fillProportionallyView;
@property (nonatomic, weak) IBOutlet UIView *equalSpacingView;
@property (nonatomic, weak) IBOutlet UIView *equalCenteringView;

@end

@implementation ShowAllDistributionOptionsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DistributionPropertyViewController *fillVC = [[DistributionPropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFill];
    DistributionPropertyViewController *fillEquallyVC = [[DistributionPropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFillEqually];
    DistributionPropertyViewController *fillProportionallyVC = [[DistributionPropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFillProportionally];
    DistributionPropertyViewController *equalSpacingVC = [[DistributionPropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionEqualSpacing];
    DistributionPropertyViewController *equalCenteringVC = [[DistributionPropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionEqualCentering];
    
    [self addChildViewController:fillVC toParentView:self.fillView];
    [self addChildViewController:fillEquallyVC toParentView:self.fillEquallyView];
    [self addChildViewController:fillProportionallyVC toParentView:self.fillProportionallyView];
    [self addChildViewController:equalSpacingVC toParentView:self.equalSpacingView];
    [self addChildViewController:equalCenteringVC toParentView:self.equalCenteringView];
}

- (void)addChildViewController:(UIViewController *)childController toParentView:(UIView *)parentView {
    UIView *subview = childController.view;
    UILayoutGuide *margins = parentView.layoutMarginsGuide;
    
    [self addChildViewController:childController];
    [childController didMoveToParentViewController:self];
    
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    parentView.layoutMargins = UIEdgeInsetsZero;
    
    [parentView addSubview:subview];
    [childController.view.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [childController.view.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;
    [childController.view.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [childController.view.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
}

@end

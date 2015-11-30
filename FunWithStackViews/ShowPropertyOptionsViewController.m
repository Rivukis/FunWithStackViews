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

@property (nonatomic, weak) IBOutlet UIStackView *stackView;

@property (nonatomic, assign) ShowPropertyOption showPropertyOption;

@end

@implementation ShowPropertyOptionsViewController

- (instancetype)initWithShowPropertyOption:(ShowPropertyOption)showPropertyOption {
    self = [super init];
    if (self) {
        _showPropertyOption = showPropertyOption;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers {
    switch (self.showPropertyOption) {
        case ShowPropertyOptionDistribution:
            [self setupDistributionOptionChildViewControllers];
            break;
        case ShowPropertyOptionAlignment:
            [self setupAlignmentOptionChildViewControllers];
            break;
    }
}

- (void)setupDistributionOptionChildViewControllers {
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFill]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFillEqually]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionFillProportionally]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionEqualSpacing]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithDistributionOption:UIStackViewDistributionEqualCentering]];
}

- (void)setupAlignmentOptionChildViewControllers {
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithAlignmentOption:UIStackViewAlignmentFill]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithAlignmentOption:UIStackViewAlignmentTop]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithAlignmentOption:UIStackViewAlignmentCenter]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithAlignmentOption:UIStackViewAlignmentBottom]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithAlignmentOption:UIStackViewAlignmentFirstBaseline]];
    [self addToStachViewChildViewController:[[PropertyViewController alloc] initWithAlignmentOption:UIStackViewAlignmentLastBaseline]];
}

- (void)addToStachViewChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    [childViewController didMoveToParentViewController:self];
    [self.stackView addArrangedSubview:childViewController.view];
}

@end
